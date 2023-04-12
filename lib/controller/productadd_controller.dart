import 'package:get/get.dart';

import '../common.dart';
import '../modal/entity/product.dart';

class ProductController extends GetxController {
  RxList<Product> productList = <Product>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    getProductData();
    super.onInit();
  }

  getProductData() async {
    productList.value = await Common().getAllData();
  }
}
