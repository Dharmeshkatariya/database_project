// database.dart

// required package imports
import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'modal/entity/card.dart';
import 'modal/dao/card_dao.dart';
import 'modal/entity/person.dart';
import 'modal/dao/person_dao.dart';
import 'modal/entity/product.dart';
import 'modal/dao/product_dao.dart';

part 'database.g.dart'; // the generated code will be there

@Database(version: 3, entities: [Person, Product,CardItem ])
abstract class AppDatabase extends FloorDatabase {
  PersonDao get personDao;

  ProductDao get productDao;

  CardDao get cardDao;
}
