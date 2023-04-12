
import 'package:floor/floor.dart';

@entity
class CardItem {
  @primaryKey
  final int id;

  final String name;
  final String desc;
  final double price;
  final int qty;
  final double discount;

  CardItem(this.id, this.name, this.desc, this.price, this.qty, this.discount);
}
