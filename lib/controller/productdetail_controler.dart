import 'package:get/get.dart';

import '../common.dart';
import '../modal/entity/card.dart';
import '../modal/entity/product.dart';
import '../screen/viewcardpage.dart';

class ProductDetailsController extends GetxController {
  Product? product;
  RxInt productQty = 1.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  updateQty(bool isAdd) {
    if (isAdd) {
      productQty.value++;
    } else {
      if (productQty.value > 1) {
        productQty.value--;
      }
    }
  }

  addCard() async {
    CardItem card = CardItem(
      Common().getRandomId(),
      product!.name,
      product!.desc,
      product!.price,
      productQty.value,
      product!.discount,
    );
    await Common().insertCard(card);
    Get.to(() => const ViewCardPage());
  }
}
