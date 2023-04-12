import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/cart_controller.dart';
import '../modal/entity/card.dart';

class ViewCardPage extends StatelessWidget {
   ViewCardPage({Key? key}) : super(key: key);

  final _cardController = Get.put(CardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.white,
        title: const Text(
          "View Cart",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: Obx(() => Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(children: [
          Expanded(
            child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: _cardController.cardList.length,
                itemBuilder: (BuildContext context, int index) {
                  return _listItem(index);
                }),
          ),
          _container(),
        ]),
      )),
    );
  }

  Widget _listItem(int index) {
    CardItem cardItem = _cardController.cardList[index];
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.red.shade50,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Name : ${(cardItem.name)}",
                style:
                const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
              ),
              Text(
                "Price : ${(cardItem.price)}",
                style:
                const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "No of qty : ${(cardItem.qty)} ",
                style:
                const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
              ),
              Text(
                "Discount : ${(cardItem.discount)}",
                style:
                const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _container() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Obx(() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Total Price : ${_cardController.total.value}"),
          const SizedBox(
            height: 20,
          ),
          const Text("Total Tax : 5%"),
          const SizedBox(
            height: 20,
          ),
          Text("Total discount : ${_cardController.discountTotal.value}  "),
          const SizedBox(
            height: 20,
          ),
          Text(
              "Total Estimate Price: ${_cardController.estimatePrice.value}"),
        ],
      )),
    );
  }
}
