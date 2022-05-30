import 'package:flutter/material.dart';
import '../model/product.dart';

class ProductInfo extends StatelessWidget {
  final ProductData data;
  ProductInfo({Key? key, required ProductData this.data})
      : super(key: key);

  TextStyle titleStyle = TextStyle(
    fontSize: 35,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.width,
                color: Colors.yellow,
              ),
              Text(data.title ?? "제목 없음", style: titleStyle,),
              Text(data.content ?? ""),
              // 스크롤 확인용
              Container(height: 300),
              Container(height: 300),
            ]),
          ),
        ),
        Container(
          height: 100,
          width: double.infinity,
          color: Color.fromARGB(255, 237, 237, 237),
          child: Row(
            children: [
              Expanded(
                  flex: 2,
                  child: Icon(
                    Icons.favorite_border_outlined,
                    size: 50,
                  )),
              Container(
                color: Colors.black,
                width: 2,
                height: 50,
              ),
              Expanded(
                flex: 4,
                child: Container(
                    alignment: Alignment.center,
                    child: Text(data.price.toString() + " 원")),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  alignment: Alignment.center,
                  child: Text("채팅으로 거래하기"),
                ),
              ),
            ],
          ),
        )
      ],
    )));
  }
}
