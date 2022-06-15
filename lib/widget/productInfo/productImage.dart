import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../pages/3dView.dart';
import '../../controller/navigator.dart';

class ProductImage extends StatefulWidget {
  final List<String> images;
  const ProductImage({Key? key, required this.images}) : super(key: key);

  @override
  State<ProductImage> createState() => _ProductImageState();
}

class _ProductImageState extends State<ProductImage> {
  Widget ImageLayout(String filename) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.width,
      child: Image.asset("asset/images/$filename", fit: BoxFit.cover),
    );
  }

  @override
  Widget build(BuildContext context) {
    NavigatorController navigation = NavigatorController(context);

    return Stack(children: [
      Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.width,
        child: CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 1.0,
            aspectRatio: 1,
            reverse: false,
          ),
          items: widget.images.map((e) => ImageLayout(e)).toList(),
        ),
      ),
      Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.width,
        alignment: Alignment.bottomRight,
        padding: const EdgeInsets.only(right: 10, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
                onTap: () {
                  navigation.navigatorAdd(threedView());
                },
                child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.grey.withOpacity(0.5),
                    ),
                    child: const Icon(Icons.threed_rotation))),
          ],
        ),
      )
    ]);
  }
}
