import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddImage extends StatefulWidget {
  const AddImage({Key? key}) : super(key: key);

  @override
  State<AddImage> createState() => _AddImageState();
}

class _AddImageState extends State<AddImage> {
  List<String?> imageFiles = [];

  @override
  Widget build(BuildContext context) {
    final ImagePicker _picker = ImagePicker();

    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            GestureDetector(
              onTap: () async {
                final XFile? image =
                    await _picker.pickImage(source: ImageSource.gallery);
                if (image != null) {
                  setState(() {
                    imageFiles.add(image.path);
                  });
                }
              },
              child: Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey, width: 1)),
                  child: Icon(
                    Icons.add_a_photo_outlined,
                    color: Colors.grey,
                  )),
            ),
            ...imageFiles.map((path) => Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: FileImage(File(path ?? "")),//File Image를 삽입
                        fit: BoxFit.cover)),
                ),
              ],
            )).toList()
          ],
        ),
      ),
    );
  }
}
