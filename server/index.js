 //imports from packages
 const express= require("express")
 const mongoose= require('mongoose');

//init
 const app=express();
 const PORT =8000

// import from other files 
 const authRouter=require("./routes/auth")
 const adminrouter=require("./routes/admin");
const productRouter = require("./routes/product");
const userRouter = require("./routes/user");

//middleware
// client->middleware->server->client

app.use(express.json())
app.use(authRouter)
app.use(adminrouter)
app.use(productRouter)
app.use(userRouter);

const db="mongodb+srv://divy3949:divy2004@cluster0.yq2onjb.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0";
//connection
mongoose
 .connect(db)
 .then(()=>{
          console.log("connection Successfull ");
})

 .catch((e)=>{
          console.log(e);
});

app.listen(PORT,()=>{
          console.log(`connected at port ${PORT}`)
})