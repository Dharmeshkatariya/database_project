import 'package:floordatabaseflutter/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/product_controller.dart';
import '../modal/entity/product.dart';

class EditProduct extends StatelessWidget{
  EditProduct({super.key, this.product, required this.isEdit});

  final Product? product;
  final bool isEdit;
  final _addProductController = Get.put(AddProductController());

  @override
  Widget build(BuildContext context) {
    _addProductController.setData(isEdit, product);
    return Scaffold(
     appBar:  AppBar(
       centerTitle: true,
       iconTheme: const IconThemeData(
         color: Colors.black, //change your color here
       ),
       backgroundColor: Colors.white,
       title: const Text(
         "Add Product",
         style: TextStyle(
             fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
       ),
     ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Form(
            key: _addProductController.form,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Common.textField(
                  text: "Name",
                  keyboardType: TextInputType.name,
                  controller: _addProductController.nameController,
                  validator: (value) {
                    if (_addProductController.nameController.text.isEmpty) {
                      return 'name  is required';
                    }
                    return null;
                  },
                ),
                Common.textField(
                    text: "Price",
                    keyboardType: TextInputType.number,
                    controller: _addProductController.priceController),
                Row(
                  children: [
                    Expanded(
                      child:  Common.textField(
                          text: "Qty",
                          keyboardType: TextInputType.number,
                          controller: _addProductController.qtyController),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child:  Common.textField(
                          text: "Discount",
                          keyboardType: TextInputType.number,
                          controller: _addProductController.discountController),
                    ),
                  ],
                ),
                Common.textField(
                    text: "Description",
                    keyboardType: TextInputType.name,
                    controller: _addProductController.descController),
                GestureDetector(
                  onTap: () {
                    if (_addProductController.form.currentState!.validate()) {
                      isEdit? _addProductController.updateProduct(product!): _addProductController.addProduct();
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 40),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 60),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      isEdit ? "Update" : "Add",
                      style:const  TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
