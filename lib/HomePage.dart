import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:ui';
import 'dart:io';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File myImage;

  // Function to open a camera
  Future openCamera() async {
    var cameraImage = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      myImage = cameraImage;
    });
  }

  // Function to open a local gallery
  Future openGalley() async {
    var galleryImage = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      myImage = galleryImage;
    });
  }

  // Function to show dialog box
  Future<void> openDialogBox() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(),
          backgroundColor: Colors.blue,
          title: Text(
            'Choose options',
            style: TextStyle(color: Colors.white),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                MaterialButton(
                  color: Colors.blue[900],
                  child: Text(
                    "Open Camera",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    openCamera();
                  },
                ),
                MaterialButton(
                  color: Colors.blue[900],
                  child: Text(
                    "Open Galley",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    openGalley();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Camera App"),
      ),
      body: Container(
        child: myImage == null
            ? Center(
                child: Text(
                "No image selected",
                style: TextStyle(
                  fontSize: 20,
                ),
              ))
            : Image.file(myImage),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          openDialogBox();
        },
        child: Icon(Icons.add_a_photo),
      ),
    );
  }
}
