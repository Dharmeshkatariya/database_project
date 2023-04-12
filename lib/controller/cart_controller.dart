import 'package:get/get.dart';

import '../common.dart';
import '../modal/entity/card.dart';

class CardController extends GetxController {
  RxList<CardItem> cardList = <CardItem>[].obs;

  RxDouble total = 0.0.obs;
  RxDouble discountTotal = 0.0.obs;
  RxDouble estimatePrice = 0.0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    getProductData();
    super.onInit();
  }

  getProductData() async {
    cardList.value = await Common().getAllCard();
    getTotal();
  }

  getTotal() {
    for (int a = 0; a < cardList.length; a++) {
      total.value += (cardList[a].price * cardList[a].qty);
      discountTotal.value += cardList[a].discount;
    }
    var totalPrice = (total.value - discountTotal.value);
    var gst = (totalPrice * 5) / 100;
    estimatePrice.value = totalPrice + gst;
  }
}
