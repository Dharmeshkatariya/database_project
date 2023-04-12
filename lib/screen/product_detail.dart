import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/productdetail_controler.dart';
import '../modal/entity/product.dart';
import 'editproduct.dart';


class ProductDetail extends StatelessWidget {
  ProductDetail({super.key, required this.product});

  final Product product;
  final productDetailsController = Get.put(ProductDetailsController());

  @override
  Widget build(BuildContext context) {
    productDetailsController.product = product;
    productDetailsController.productQty.value = product.qty;
    return Scaffold(
      appBar: AppBar(
        iconTheme:const IconThemeData(
          color: Colors.black, //change your color here
        ),
        actions: [
          GestureDetector(
              onTap: () {
                product.qty = productDetailsController.productQty.value;
                Get.off(() => EditProduct(
                  product: product,
                  isEdit: true,
                ));
              },
              child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Icon(
                    Icons.edit,
                    color: Colors.black,
                  ))),
        ],
        backgroundColor: Colors.white,
        title: const Text(
          "Product Detail",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.blueGrey),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _productRow(),
                  const SizedBox(
                    height: 20,
                  ),
                  _qtyRow(),
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    "Description...  \n${productDetailsController.product!.desc}",
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                productDetailsController.addCard();
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12), color: Colors.red),
                padding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                margin:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: const Text(
                  "Add To Cart",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _productRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Name : ${productDetailsController.product!.name}",
              style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Colors.white),
            ),
            Text(
              "price : ${productDetailsController.product!.price}",
              style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Colors.white),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "qty",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Colors.white),
            ),
            Text(
              "Discount : ${productDetailsController.product!.discount}",
              style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Colors.white),
            ),
          ],
        ),
      ],
    );
  }

  Widget _qtyRow() {
    return Obx(() => Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => {
            productDetailsController.updateQty(false),
          },
          child: const Icon(Icons.close, color: Colors.white),
        ),
        Text(
          '${productDetailsController.productQty.value}',
          style: const TextStyle(color: Colors.white),
        ),
        GestureDetector(
          onTap: () => {
            productDetailsController.updateQty(true),
          },
          child: const Icon(Icons.add, color: Colors.white),
        ),
        const Text(
          "Total Price",
          style: TextStyle(color: Colors.white),
        ),
      ],
    ));
  }
}
