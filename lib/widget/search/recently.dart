import 'package:flutter/material.dart';

import './keyword.dart';

class RecentlyKeyword extends StatelessWidget {
  RecentlyKeyword({Key? key}) : super(key: key);
  List<String> _keyword = ["자전거", "노트북", "의자", "맥북", "닌텐도", "김치", "고양이", "장혁순"];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("최근 검색어", style: Theme.of(context).textTheme.subtitle1),
              Text("모두 지우기", style: Theme.of(context).textTheme.subtitle2),
            ],
          ),
          const SizedBox(height: 20),
          SingleChildScrollView(
            child: Column(
              children: _keyword.map((e) => Keyword(text: e)).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
