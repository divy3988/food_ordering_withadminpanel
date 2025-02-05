const express=require('express');
const adminrouter =express.Router();

const admin =require('../middlewares/admin');
const {Product} = require('../models/product');

adminrouter.post('/admin/add-product',admin,async(req,res)=>{
          try{
               const{name,admin_name, description,images,price,category}=req.body
               let product= new Product({
                    name,admin_name,description,images,price,category
               });
               product =await product.save();
               res.json(product);
          }
          catch(e){
            console.log(e.message)
                    res.status(500).json({
                           error: e.message
                    });
          }
});
adminrouter.get("/admin/get-products", admin, async (req, res) => {
     try {
       const products = await Product.find({});
       res.json(products);
     } catch (e) {
       res.status(500).json({ error: e.message });
     }
   });

   adminrouter.post("/admin/delete-product", admin, async (req, res) => {
     try {
       const { id } = req.body;
       let product = await Product.findByIdAndDelete(id);
       res.json(product);
     } catch (e) {
       res.status(500).json({ error: e.message });
     }
   });
module.exports = adminrouter;