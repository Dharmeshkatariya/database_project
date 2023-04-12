// entity/person.dart

import 'package:floor/floor.dart';

@entity
class Product {
  @primaryKey
  final int id;

  final String name;
  final String desc;
  final double price;
  int qty;
  final double discount;

  Product(this.id, this.name, this.desc, this.price, this.qty, this.discount);
}
