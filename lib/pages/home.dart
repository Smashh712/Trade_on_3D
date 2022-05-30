import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'addPost.dart';
import '../controller/navigator.dart';
import '../widget/home/product.dart';
import '../model/product.dart';
import '../provider/addPost/selectionImageProvider.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  List<ProductData> items = [
    ProductData(
        id: 1, title: "상품 이름1", content: "싸게 팝니다11", price: 3000, seller: 1),
    ProductData(
        id: 2, title: "상품 이름2", content: "싸게 팝니다22", price: 50000, seller: 2),
    ProductData(
        id: 3, title: "상품 이름3", content: "싸게 팝니다33", price: 4000, seller: 3),
    ProductData(
        id: 4, title: "상품 이름4", content: "싸게 팝니다44", price: 4000, seller: 3),
    ProductData(
        id: 5, title: "상품 이름5", content: "싸게 팝니다55", price: 4000, seller: 3),
    ProductData(
        id: 6, title: "상품 이름6", content: "싸게 팝니다66", price: 4000, seller: 3),
    ProductData(
        id: 7, title: "상품 이름7", content: "싸게 팝니다77", price: 4000, seller: 3),
    ProductData(
        id: 8, title: "상품 이름8", content: "싸게 팝니다88", price: 4000, seller: 3),
  ];

  @override
  Widget build(BuildContext context) {
    NavigatorController navigation = new NavigatorController(context);

    return Stack(
      children: [
        Container(
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(10),
                  itemCount: items.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Product(data: items[index]);
                  },
                ),
              )
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 20, 20),
            child: FloatingActionButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ChangeNotifierProvider(
                        create: (_) => SelectionImageProvider(),
                        child: AddPostPage()),
                  ),
                );
              },
              child: Icon(Icons.create),
            ),
          ),
        ),
      ],
    );
  }
}
