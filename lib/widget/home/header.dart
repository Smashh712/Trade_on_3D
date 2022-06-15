import 'package:flutter/material.dart';
import 'package:select_form_field/select_form_field.dart';

class HomeHeader extends StatelessWidget {
  HomeHeader({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> _items = [
    {'value': 'sell', 'label': '판매합니다'},
    {'value': 'buy', 'label': '구매합니다'}
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(
              children: [
                SizedBox(
                  width: 110,
                  child: SelectFormField(
                    type: SelectFormFieldType.dropdown,
                    style: Theme.of(context).textTheme.headline1,
                    initialValue: 'sell',
                    items: _items,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Icon(Icons.arrow_drop_down)
              ],
            ),
            Row(
              children: [
                Icon(Icons.search, size: 36.0),
                SizedBox(width: 30),
                Icon(Icons.menu, size: 36.0),
                SizedBox(width: 30),
                Icon(Icons.notifications_none_outlined, size: 36.0),
              ],
            ),
          ]),
        ),
        Divider(),
      ],
    );
  }
}
