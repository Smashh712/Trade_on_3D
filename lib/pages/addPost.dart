import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../widget/addPost/header.dart';
import '../widget/addPost/addImage.dart';
import '../widget/addPost/addVideo.dart';

class AddPostPage extends StatefulWidget {
  AddPostPage({Key? key}) : super(key: key);

  @override
  State<AddPostPage> createState() => _AddPostPageState();
}

class _AddPostPageState extends State<AddPostPage> {
  List<String?> imageFiles = [];

  @override
  Widget build(BuildContext context) {
    final ImagePicker _picker = ImagePicker();

    return Scaffold(
      body: SafeArea(
          child: Column(
            children: [
              AddPostHeader(),
              SingleChildScrollView(
        child: Column(
              children: [
                AddImage(),
                Divider(),
                AddVideo(),
                Divider(),
                Container(
                  height: 90,
                  child: Text("제목"),
                ),
                Divider(),
                Container(
                  height: 90,
                  child: Text("카테고리"),
                ),
                Divider(),
                Container(
                  height: 90,
                  child: Text("가격"),
                ),
                Divider(),
                Container(
                  child: Text("내용"),
                )
              ],
        ),
      ),
            ],
          )),
    );
  }
}
