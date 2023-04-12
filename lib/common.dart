import 'dart:math';

import 'package:flutter/cupertino.dart';

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

  Widget _button() {
    return GestureDetector(onTap: () {}, child: Container());
  }
}
