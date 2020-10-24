import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File _imageFile;
  Future cameraImage() async {
    PickedFile pickedFile =
        await ImagePicker().getImage(source: ImageSource.camera);
    setState(() {
      _imageFile = File(pickedFile.path);
    });
  }

  Future galaryAccess() async {
    PickedFile pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {
      _imageFile = File(pickedFile.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: 500,
            width: double.infinity,
            color: Colors.blue,
            child: _imageFile == null
                ? Center(child: Text("photo is not selected"))
                : Image.file(_imageFile),
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                onPressed: () {
                  cameraImage();
                },
                child: Icon(Icons.camera),
              ),
              SizedBox(
                width: 20,
              ),
              FloatingActionButton(
                onPressed: () {
                  galaryAccess();
                },
                child: Icon(Icons.photo_library),
              )
            ],
          )
        ],
      ),
    );
  }
}
