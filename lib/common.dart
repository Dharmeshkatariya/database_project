import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

import 'database.dart';
import 'modal/card.dart';
import 'modal/product.dart';

class Common {
  static String productDetail = '/product_detail';

  int getRandomId() {
    var random = Random();
    return random.nextInt(100);
  }

  static var database;

  initDatabase() async {
    database ??=
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  }

  insertData(Product product) async {
    try {
      final productDao = database.productDao;

      var res = await productDao.insertProduct(product);
      print(res);
    } catch (e) {
      print(e);
    }
  }

  Future<List<Product>> getAllData() async {
    final productDao = database.productDao;
    List<Product> res = await productDao.findAllProducts();
    print(res);
    return res;
  }

  updateProduct(Product product) async {
    try {
      final productDao = database.productDao;
      var res = await productDao.updateProductById(product.id, product.name,
          product.desc, product.price, product.qty, product.discount);
      print(res);
    } catch (e) {
      print(e);
    }
  }

  insertCard(CardItem card) async {
    try {
      final cardDao = database.cardDao;

      var res = await cardDao.insertCard(card);
      print(res);
    } catch (e) {
      print(e);
    }
  }

  Future<List<CardItem>> getAllCard() async {
    final cardDao = database.cardDao;
    List<CardItem> res = await cardDao.findAllCards();
    print(res);
    return res;
  }

  static Widget button({required String text,GestureTapCallback? onTap}) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(20),
          ),
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          margin: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
          child: Text(
            text,
            style:const  TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.white),
          ),
        ));
  }

 static Widget textField(
      {String? text,
      TextEditingController? controller,
      dynamic validator,
      TextInputType? keyboardType}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        keyboardType: keyboardType,
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            hintText: text,
            labelText: text,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            )),
      ),
    );
  }
}
