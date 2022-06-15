import 'package:flutter/material.dart';

class AddPostHeader extends StatelessWidget {
  const AddPostHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back, size: 36)),
                  SizedBox(width: 20),
                  Text("중고거래 글쓰기",
                      style: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(fontSize: 20)),
                ],
              ),
              Text("완료",
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(color: Theme.of(context).colorScheme.primary))
            ],
          ),
          Divider(),
        ],
      ),
    );
  }
}
