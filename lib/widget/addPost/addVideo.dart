import 'dart:async';
import 'dart:io';
import 'package:provider/provider.dart';
import 'package:media_info/media_info.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../pages/imageSelection.dart';
import '../../provider/addPost/selectionImageProvider.dart';

class AddVideo extends StatefulWidget {
  const AddVideo({Key? key}) : super(key: key);

  @override
  State<AddVideo> createState() => _AddVideoState();
}

class _AddVideoState extends State<AddVideo> {
  late SelectionImageProvider _selectionImageProvider;

  @override
  Widget build(BuildContext context) {
    _selectionImageProvider =
        Provider.of<SelectionImageProvider>(context, listen: true);
    List<String?> imageFiles = _selectionImageProvider.imageFiles;
    final ImagePicker _picker = ImagePicker();
    final MediaInfo _mediaInfo = MediaInfo();
    bool hasImage = false;

    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            GestureDetector(
              onTap: () async {
                final XFile? video = await _picker.pickVideo(
                    source: ImageSource.gallery,
                    maxDuration: const Duration(seconds: 10));
                if (video != null) {
                  Map<String, dynamic> mediaInfo =
                      await _mediaInfo.getMediaInfo(video.path);
                  int duration = mediaInfo['durationMs'];
                  int perFrame = duration ~/ 50;

                  final Directory cacheDir = await getTemporaryDirectory();
                  List<String?> imagesData = [];
                  EasyLoading.show(status: '사진으로 변환중 입니다...');
                  for (var time = 0; time < duration; time += perFrame) {
                    Directory target = Directory('${cacheDir.path}/$time');
                    if (!target.existsSync()) {
                      target.create();
                    }

                    final file = await VideoThumbnail.thumbnailFile(
                      video: video.path,
                      thumbnailPath: target.path,
                      imageFormat: ImageFormat.JPEG,
                      maxHeight: 512,
                      quality: 100,
                      timeMs: time,
                    );
                    imagesData.add(file);
                  }
                  EasyLoading.showSuccess('완료되었습니다!');
                  _selectionImageProvider.setProvider(imagesData);
                  final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChangeNotifierProvider.value(
                              value: _selectionImageProvider,
                              child: ImageSelect())));
                  setState(() {});
                }
              },
              child: Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey, width: 1)),
                  child: Icon(
                    Icons.video_call_outlined,
                    size: 30,
                    color: Colors.grey,
                  )),
            ),
            ...imageFiles
                .map((path) => Visibility(
                      visible: true,
                      child: Row(
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
                                    image: FileImage(
                                        File(path ?? "")), //File Image를 삽입
                                    fit: BoxFit.cover)),
                          ),
                        ],
                      ),
                    ))
                .toList()
          ],
        ),
      ),
    );
  }
}
