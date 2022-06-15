import 'package:flutter/material.dart';
import 'package:trade_flatform/model/product.dart';

class Content extends StatelessWidget {
  late ProductData data;
  Content({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.title ?? "제목 없음",
                  style: Theme.of(context).textTheme.headline2!.copyWith(fontSize: 24),
                ),
                Text(data.category ?? "카테고리", style: Theme.of(context).textTheme.subtitle2),
                SizedBox(height: 30),
                Text(data.content ?? "", style: Theme.of(context).textTheme.bodyText1),
              ],
            ),
          );
  }
}
