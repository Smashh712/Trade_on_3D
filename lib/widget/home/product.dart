import 'package:flutter/material.dart';

import '../../controller/navigator.dart';
import '../../pages/productInfo.dart';
import '../../model/product.dart';

class Product extends StatelessWidget {
  final ProductData data;
  const Product({Key? key, required ProductData this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NavigatorController naviagation = NavigatorController(context);

    return GestureDetector(
      onTap: () {
        naviagation.navigatorAdd(ProductInfo(data: data));
      },
      child: Container(
          height: 150,
          width: double.infinity,
          // color: Colors.grey,
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  width: 100,
                  height: 130,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              Expanded(
                flex: 7,
                child: Container(
                  padding: EdgeInsets.only(left: 10),
                  height: 130,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(data.title ?? "제목 없음",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                color: Colors.black,
                              )),
                      Text(data.price.toString() + " 원",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                fontSize: 16,
                                color: Colors.grey,
                              )),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
