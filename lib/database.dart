// database.dart

// required package imports
import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'modal/card.dart';
import 'modal/card_dao.dart';
import 'modal/person.dart';
import 'modal/persondao.dart';
import 'modal/product.dart';
import 'modal/product_dao.dart';

part 'database.g.dart'; // the generated code will be there

@Database(version: 3, entities: [Person, Product,CardItem ])
abstract class AppDatabase extends FloorDatabase {
  PersonDao get personDao;

  ProductDao get productDao;

  CardDao get cardDao;
}
