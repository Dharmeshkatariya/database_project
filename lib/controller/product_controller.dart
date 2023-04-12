import 'package:floordatabaseflutter/controller/productadd_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../common.dart';
import '../modal/entity/product.dart';

class AddProductController extends GetxController {
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final discountController = TextEditingController();
  final descController = TextEditingController();
  final qtyController = TextEditingController();
  final form = GlobalKey<FormState>();

  bool isEdit = false;

  setData(bool isEdit, Product? product) {
    this.isEdit = isEdit;
    if (isEdit) {
      nameController.text = product!.name;
      priceController.text = product.price.toString();
      discountController.text = product.discount.toString();
      descController.text = product.desc;
      qtyController.text = product.qty.toString();
    }
  }

  addProduct() async {
   try{
     Product product = Product(
         Common().getRandomId(),
         nameController.text,
         descController.text,
         double.parse(priceController.text),
         int.parse(qtyController.text),
         double.parse(discountController.text));
     await Common().insertData(product);
     ProductController productController = Get.find();
     productController.getProductData();
     Get.back();
   }catch(e){
     print(e);
   }
  }
  updateProduct(Product Products) async {
    Product product = Product(
        Products.id,
        nameController.text,
        descController.text,
        double.parse(priceController.text),
        int.parse(qtyController.text),
        double.parse(discountController.text));
    await Common().updateProduct(product);
    ProductController productController = Get.find();
    productController.getProductData();
    Get.back();
  }

  @override
  void dispose() {
    nameController.dispose();
    priceController.dispose();
    discountController.dispose();
    descController.dispose();
    qtyController.dispose();

    super.dispose();
  }
}
