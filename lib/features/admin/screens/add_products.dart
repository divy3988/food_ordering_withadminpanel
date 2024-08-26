import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery/common/custom_button.dart';
import 'package:food_delivery/common/custom_textfields.dart';
import 'package:food_delivery/constants/utils.dart';
import 'package:food_delivery/features/admin/services/admin_services.dart';

class AddProducts extends StatefulWidget {
  static const route_name = '/addproduct';
  const AddProducts({super.key});

  @override
  State<AddProducts> createState() => _AddProductsState();
}

class _AddProductsState extends State<AddProducts> {
  List<String> categories = [
    'Noodles',
    'Cakes',
    'Parantha',
    'Momos',
    'Pizza',
    'Burger',
  ];

  String Category = "Noodles";
  List<File> images = [];

  void selectimages() async {
    var res = await pickImages();
    setState(() {
      images = res;
    });
  }

  final TextEditingController productNamecontroller = TextEditingController();
  final TextEditingController productPricecontroller = TextEditingController();
  final TextEditingController productDescriptioncontroller =
      TextEditingController();
  final AdminService adminServices = AdminService();
  final _addProductformKey = GlobalKey<FormState>();

  void sellProduct() {
    if (_addProductformKey.currentState!.validate()) {
      setState(() {});
      adminServices.sellProduct(
          context: context,
          name: productNamecontroller.text,
          description: productDescriptioncontroller.text,
          price: double.parse(productPricecontroller.text),
          category: Category,
          images: images);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Product "),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: GestureDetector(
                onTap: () {}, child: Icon(Icons.density_small_sharp)),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
            key: _addProductformKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  images.isNotEmpty
                      ? Image(image: AssetImage(images[0].path))
                      : GestureDetector(
                          onTap: selectimages,
                          child: Container(
                            width: double.infinity,
                            height: 150,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.folder_open,
                                  size: 40,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  "Select Product Image ",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey.shade400),
                                )
                              ],
                            ),
                          ),
                        ),
                  SizedBox(
                    height: 30,
                  ),
                  CustomTextField(
                      controller: productNamecontroller, text: "Product Name"),
                  SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                    controller: productDescriptioncontroller,
                    text: " Description ",
                    maxLines: 8,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                      controller: productPricecontroller, text: " Price "),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: DropdownButton(
                      value: Category,
                      items: categories.map((String item) {
                        return DropdownMenuItem(value: item, child: Text(item));
                      }).toList(),
                      onChanged: (dynamic newVal) {
                        setState(() {
                          Category = newVal;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CustomButton(
                    text: " Sell ",
                    onTap: sellProduct,
                  )
                ],
              ),
            )),
      ),
    );
  }
}
