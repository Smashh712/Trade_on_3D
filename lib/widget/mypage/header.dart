import 'package:flutter/material.dart';

class MypageHeader extends StatelessWidget {
  const MypageHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("마이페이지", style: Theme.of(context).textTheme.headline1),
                Icon(Icons.settings),
              ],
            )),
        Divider(),
      ],
    );
  }
}
