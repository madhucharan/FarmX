import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

class Leafdisease extends StatefulWidget {
  @override
  _LeafdiseaseState createState() => _LeafdiseaseState();
}

class _LeafdiseaseState extends State<Leafdisease> {
  File imagefile;
  //List imageArray = [];
  List _result;
  String _diseasename = "";
  String _confidence = "";

  void _openGallery(BuildContext context) async {
    // ignore: invalid_use_of_visible_for_testing_member
    PickedFile pickedfile =
        await ImagePicker().getImage(source: ImageSource.gallery);
    imagefile = File(pickedfile.path);
    Navigator.of(context).pop();
    this.setState(() {});
  }

  void _openCamera(BuildContext context) async {
    // ignore: invalid_use_of_visible_for_testing_member
    PickedFile pickedFile =
        await ImagePicker().getImage(source: ImageSource.camera);
    imagefile = File(pickedFile.path);
    Navigator.of(context).pop();
    this.setState(() {});
  }

  loadMyModel() async {
    var resultant = await Tflite.loadModel(
      labels: "assets/models/labels.txt",
      model: "assets/models/model.tflite",
    );
    print("Result after loading model : $resultant");
  }

  applyModelOnImage(File imagefile) async {
    var res = await Tflite.runModelOnImage(
        path: imagefile.path, // required
        imageMean: 0.0, // defaults to 117.0
        imageStd: 255.0, // defaults to 1.0
        numResults: 2, // defaults to 5
        threshold: 0.2, // defaults to 0.1
        asynch: true // defaults to true
        );

    setState(() {
      _result = res;
      String str = _result[0]["label"];
      _diseasename = str.substring(2);
      _confidence = _result != null
          ? (_result[0]['confidence'] * 100.0).toString().substring(0, 2) + "%"
          : " ";
    });
  }

  @override
  void initState() {
    super.initState();
    loadMyModel();
    setState(() {});
  }

  Future<void> _showDialogBox(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Open Using"),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  GestureDetector(
                    child: Text('Gallery'),
                    onTap: () {
                      _openGallery(context);
                    },
                  ),
                  Padding(padding: EdgeInsets.all(8.0)),
                  GestureDetector(
                    child: Text('Camera'),
                    onTap: () {
                      _openCamera(context);
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Leaf Disease Identification'),
        backgroundColor: Colors.green[600],
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              SizedBox(height: 30),
              imagefile == null
                  ? Text('Select an image')
                  : Center(
                      child: Container(
                      height: 350,
                      width: 350,
                      child: Image.file(imagefile),
                    )),
              Container(),
              SizedBox(height: 10),
              Text("DiseaseName : $_diseasename\n Confidence: $_confidence "),
              RaisedButton(
                onPressed: () {
                  _showDialogBox(context);
                },
                child: Text('Image'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
