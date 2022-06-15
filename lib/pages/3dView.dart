import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class threedView extends StatelessWidget {
  String austronutPath =
      "https://modelviewer.dev/shared-assets/models/Astronaut.glb";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Model Viewer")),
        body: ModelViewer(
          src: 'asset/bag.glb',
          alt: "A 3D model of an astronaut",
          ar: true,
          autoRotate: true,
          cameraControls: true,
        ),
      ),
    );
  }
}
