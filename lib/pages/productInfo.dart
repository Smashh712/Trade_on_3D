import 'package:flutter/material.dart';

import '../widget/productInfo/productImage.dart';
import '../widget/productInfo/content.dart';
import '../widget/productInfo/bottomBar.dart';
import '../model/product.dart';

class ProductInfo extends StatelessWidget {
  final ProductData data;
  ProductInfo({Key? key, required this.data}) : super(key: key);

  TextStyle titleStyle = TextStyle(
    fontSize: 35,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
        child: Column(
          children: [
          ProductImage(images: data.images ?? ["none.gif"]),
          Content(data: data),
        ]),
          ),
        ),
        BottomBar(data: data),
      ],
    ));
  }
}
