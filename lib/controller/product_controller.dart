import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../modal/product.dart';

class ProductController extends GetxController {

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
