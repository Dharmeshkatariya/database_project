import 'package:floor/floor.dart';
import 'package:floordatabaseflutter/modal/entity/product.dart';

@dao
abstract class ProductDao {
  @Query('SELECT * FROM Product')
  Future<List<Product>> findAllProducts();

  @Query('SELECT * FROM Product WHERE id = :id')
  Stream<Product?> findProductById(int id);

  @insert
  Future<void> insertProduct(Product product);

  @Query(
      'Update Product SET name = :name, desc = :desc, price = :price, qty = :qty, discount = :discount WHERE id = :id')
  Future<Product?> updateProductById(
      int id, String name, String desc, double price, int qty, double discount);
}
