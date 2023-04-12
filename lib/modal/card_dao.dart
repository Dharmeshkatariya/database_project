import 'package:floor/floor.dart';

import 'card.dart';

@dao
abstract class CardDao {
  @Query('SELECT * FROM CardItem')
  Future<List<CardItem>> findAllCards();

  @Query('SELECT * FROM CardItem WHERE id = :id')
  Stream<CardItem?> findCardById(int id);

  @insert
  Future<void> insertCard(CardItem cardItem);

  @Query(
      'Update CardItem SET name = :name, desc = :desc, price = :price, qty = :qty, discount = :discount WHERE id = :id')
  Future<CardItem?> updateCardById(
      int id, String name, String desc, double price, int qty, double discount);
}
