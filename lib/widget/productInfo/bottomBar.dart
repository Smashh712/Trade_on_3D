import 'package:flutter/material.dart';
import 'package:trade_flatform/widget/home/product.dart';

import '../../model/product.dart';

class BottomBar extends StatelessWidget {
  final ProductData data;
  BottomBar({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(),
        Container(
          padding: EdgeInsets.only(top: 30, bottom: 30),
          width: double.infinity,
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Icon(
                  Icons.favorite_border_outlined,
                  size: 30,
                )),
              VerticalDivider(
                width: 3.0,
                color: Colors.grey,
              ),
              Expanded(
                flex: 4,
                child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(data.price.toString() + " 원", style: Theme.of(context).textTheme.headline2)),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  
                  alignment: Alignment.center,
                  child: Text("채팅으로 거래하기", style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.white)),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              SizedBox(width: 20,)
            ],
          ),
        ),
      ],
    );
  }
}
