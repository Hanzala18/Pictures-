import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String imagePath = "";
  final picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Picker and image cropper"),
        backgroundColor: Colors.green[400],
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          //v mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(15),
              width: double.infinity,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.green.shade700),
                ),
                onPressed: () async {
                  final pickedFile =
                      await picker.pickImage(source: ImageSource.gallery);
                  if (pickedFile != null) {
                    setState(() {
                      imagePath = pickedFile.path;
                    });
                  }
                },
                child: Text("Select Image"),
              ),
            ),
            imagePath != ""
                ? Container(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    child: Image.file(File(imagePath)),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
