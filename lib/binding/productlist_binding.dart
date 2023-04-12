import 'package:get/get.dart';

import '../controller/productadd_controller.dart';

class ProductListBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ProductController());
    // TODO: implement dependencies
  }

}