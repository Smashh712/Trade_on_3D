import 'package:flutter/material.dart';

import '../widget/mypage/header.dart';
import '../widget/mypage/progress.dart';

class Mypage extends StatelessWidget {
  const Mypage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          MypageHeader(),
          SingleChildScrollView(
            child: Progress()
            ),
        ],
      ),
    );
  }
}
