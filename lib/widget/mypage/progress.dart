import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../widget/mypage/ongoing.dart';
import '../../widget/mypage/completeModel.dart';

class Progress extends StatefulWidget {
  const Progress({Key? key}) : super(key: key);

  @override
  State<Progress> createState() => _ProgressState();
}

class _ProgressState extends State<Progress> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Text("3D모델 변환 진행중", style: Theme.of(context).textTheme.headline2),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: CarouselSlider(
                options: CarouselOptions(),
                items: [
                  OnGoing(),
                  OnGoing(),
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 10),
              child: Text("생성 및 게시글 업로드 완료", style: Theme.of(context).textTheme.headline2),
            ),
            CompleteModel(),
            CompleteModel(),
            CompleteModel(),
          ],
        ),
      ),
    );
  }
}
