import 'package:flutter/material.dart';

class CompleteModel extends StatelessWidget {
  const CompleteModel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("우주비행사 피규어", style: Theme.of(context).textTheme.headline2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("상태: 생성 완료", style: Theme.of(context).textTheme.bodyText1),
                Text("2022.06.13",
                    style: Theme.of(context).textTheme.bodyText1),
              ],
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.only(top: 30, bottom: 30),
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(),
              ),
              child: Image.asset("asset/images/aust.png", fit: BoxFit.contain),
            ),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).colorScheme.primary,
              ),
              child: Center(
                  child: Text("게시글로 이동",
                      style: Theme.of(context)
                          .textTheme
                          .headline2!
                          .copyWith(color: Colors.white))),
            )
          ],
        ),
      ),
    );
  }
}
