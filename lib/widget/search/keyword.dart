import 'package:flutter/material.dart';

class Keyword extends StatelessWidget {
  late String text;
  Keyword({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text),
            Text("X"),
          ],
        ),
        const Divider(),
        const SizedBox(height: 10)
      ],
    );
  }
}
