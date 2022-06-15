import 'package:flutter/material.dart';

import '../../controller/navigator.dart';
import '../../pages/productInfo.dart';
import '../../model/product.dart';

class Product extends StatelessWidget {
  final ProductData data;
  Product({Key? key, required ProductData this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NavigatorController naviagation = NavigatorController(context);

    return GestureDetector(
      onTap: () {
        naviagation.navigatorAdd(ProductInfo(data: data));
      },
      child: Container(
          width: double.infinity,
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset("asset/images/${data.images?[0] ?? 'none.gif'}", fit: BoxFit.cover,),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child: Container(
                      padding: const EdgeInsets.only(left: 20, top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(data.title ?? "제목 없음",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2),
                          Text("판매합니다", style: Theme.of(context).textTheme.subtitle2,),
                          Text(data.price.toString() + " 원",
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            Divider(),
            ],
          )),
    );
  }
}
