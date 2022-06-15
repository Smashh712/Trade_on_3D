import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class OnGoing extends StatefulWidget {
  const OnGoing({Key? key}) : super(key: key);

  @override
  State<OnGoing> createState() => _OnGoingState();
}

class _OnGoingState extends State<OnGoing> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("잠만보 인형", style: Theme.of(context).textTheme.headline2),
            Text("상태: 3D 모델링 생성중 ...",
                style: Theme.of(context).textTheme.bodyText1),
            SizedBox(height: 10),
            Text("등록한 3D 모델을 생성 중입니다",
                style: Theme.of(context).textTheme.subtitle1),
            LinearPercentIndicator(
              lineHeight: 20,
              percent: 0.5,
              backgroundColor: Theme.of(context).colorScheme.onPrimary,
              progressColor: Theme.of(context).colorScheme.primary,
              center: Text("50%"),
            ),
            // Text("예상 시간 2시간 30분"),
          ],
        ),
      ),
    );
  }
}
