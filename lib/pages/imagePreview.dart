import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:trade_flatform/provider/addPost/selectionImageProvider.dart';
import 'package:provider/provider.dart';

class ImagePreview extends StatefulWidget {
  late int index;

  ImagePreview({Key? key, required int this.index}) : super(key: key);

  @override
  State<ImagePreview> createState() => _ImagePreviewState();
}

class _ImagePreviewState extends State<ImagePreview> {
  late SelectionImageProvider _selectionImageProvider;

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
      appBar: AppBar(
        title: Text("${selectionCount} / ${selection.length}"),
      ),
      body: Builder(
        builder: (context) {
          final double height = MediaQuery.of(context).size.height;
          return SafeArea(
            child: Stack(
              children: [
                Expanded(
                  child: CarouselSlider(
                    options: CarouselOptions(
                        height: height,
                        viewportFraction: 1.0,
                        enlargeCenterPage: false,
                        initialPage: widget.index,
                        onPageChanged: (index, reason) {
                          setState(() {
                            widget.index = index;
                          });
                        }),
                    items: images
                        .map((image) => Center(child: Image.file(File(image!))))
                        .toList(),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(right: 30, top: 30),
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () {
                        _selectionImageProvider.selectImage(widget.index);
                      },
                      child: Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                            color: selection[widget.index]
                                ? Colors.grey
                                : Colors.yellow,
                            border: Border.all(width: 0.5),
                            shape: BoxShape.circle),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
