import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/addPost/selectionImageProvider.dart';
import '../pages/imagePreview.dart';

class ImageSelect extends StatelessWidget {
  late SelectionImageProvider _selectionImageProvider;
  ImageSelect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _selectionImageProvider =
        Provider.of<SelectionImageProvider>(context, listen: true);
    List<String?> images = _selectionImageProvider.imageFiles;
    List<bool> selection = _selectionImageProvider.selection;
    int selectionCount = selection
        .map((element) => element == true ? 1 : 0)
        .reduce((value, element) => value + element);

    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Container(
            height: 50,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text("${selectionCount} / ${selection.length}")),
                  Text("흐리게 나온 사진을 선택하세요"),
                  Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context, true);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: selectionCount >= 20
                                ? Border.all(color: Colors.grey)
                                : null),
                        height: 30,
                        width: 50,
                        child: Visibility(
                            visible: selectionCount >= 20 ? true : false,
                            child: Text("등록")),
                      ),
                    ),
                  )
                ]),
          ),
          Expanded(
            child: GridView.builder(
                itemCount: images.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1,
                  mainAxisSpacing: 3, //수평 Padding
                  crossAxisSpacing: 3, //수직 Padding
                ),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      _selectionImageProvider.selectImage(index);
                    },
                    child: Container(
                        child: Stack(children: [
                      Image.file(File(images[index] ?? ""), fit: BoxFit.fitHeight),
                      Container(
                        decoration: BoxDecoration(
                            color: selection[index]
                                ? null
                                : Colors.black.withOpacity(0.5),
                            border: selection[index]
                                ? null
                                : Border.all(
                                    color: Colors.yellow,
                                    style: BorderStyle.solid,
                                    width: 5)),
                      ),
                      Container(
                          padding: EdgeInsets.fromLTRB(5, 0, 0, 5),
                          alignment: Alignment.bottomLeft,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ChangeNotifierProvider.value(
                                              value: _selectionImageProvider,
                                              child:
                                                  ImagePreview(index: index))));
                            },
                            child: Icon(
                              Icons.open_in_new,
                              size: 15,
                            ),
                          ))
                    ])),
                  );
                }),
          ),
        ],
      ),
    ));
  }
}
