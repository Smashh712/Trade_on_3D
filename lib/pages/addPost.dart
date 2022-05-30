import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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
      appBar: AppBar(
        title: Text("중고거래 글쓰기"),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
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
      )),
    );
  }
}
