import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/leafdisease/viewdetails.dart';
import 'package:tflite/tflite.dart';
import 'package:image_picker/image_picker.dart';

class Leafdisease1 extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Leafdisease1> {
  // Variables
  bool _loading = true;
  // variable to store loaded image
  File _image;
  // variable to store tflite results
  List _output;

  String disease;
  String _confidence;
  // variable to load image
  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    // load TFLite Model
    loadModel().then((value) {
      setState(() {});
    });
  }

  // Function to perform TFLite Inference
  classifyImage(File image) async {
    //var output = await Tflite.runModelOnImage(
    //path: image.path, numResults: 38, asynch: true);

    var output = await Tflite.runModelOnImage(
        path: image.path, // required
        imageMean: 0.0, // defaults to 117.0
        imageStd: 255.0, // defaults to 1.0
        numResults: 38, // defaults to 5
        threshold: 0.2, // defaults to 0.1
        asynch: true // defaults to true
        );
    setState(() {
      // set our global variable equal to local variable
      _output = output;
      _loading = false;

      _confidence = _output != null
          ? (_output[0]['confidence'] * 100.0).toString().substring(0, 2) + "%"
          : " ";

      disease = _output[0]['label'];
    });
    print("prediction: $_output");
  }

  // Function to Load Model
  loadModel() async {
    // define model path and labels path
    await Tflite.loadModel(
        model: 'assets/models/model.tflite',
        labels: 'assets/models/label.txt',
        numThreads: 1);
  }

  // Function to dispose and clear mmemory once done inferring
  @override
  void dispose() {
    super.dispose();
    // helps avoid memory leaks
    Tflite.close();
  }

  // Function to pick image - using camera
  pickImage() async {
    // load image from source - camera/gallery
    var image = await picker.getImage(source: ImageSource.camera);
    // check if error laoding image
    if (image == null) return null;
    setState(() {
      _image = File(image.path);
    });

    // classify image
    classifyImage(_image);
  }

  // Function to pick image - using gallery
  pickGalleryImage() async {
    // load image from source - camera/gallery
    var image = await picker.getImage(source: ImageSource.gallery);
    // check if error laoding image
    if (image == null) return null;
    setState(() {
      _image = File(image.path);
    });

    // classify image
    classifyImage(_image);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 80),
            Center(
              child: Text(
                'Leaf Disease Identification',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.w500,
                    fontSize: 28),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Center(
              child: _loading
                  ? Container(
                      width: 280,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 50,
                          )
                        ],
                      ),
                    )
                  : Container(
                      child: Column(
                        children: [
                          Container(
                            height: 250,
                            child: Image.file(
                              _image,
                              width: 450,
                              height: 450,
                              scale: 0.8,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          _output != null
                              ? Text(
                                  'Predicted disease: ${_output[0]['label']} \n Confidence : ${_confidence}',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                )
                              : Container(),
                          SizedBox(
                            height: 5,
                          ),
                          FlatButton(
                            color: Colors.green,
                            onPressed: () {
                              /*setState(() {
                                _viewdetails(disease);
                              });*/
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return viewdetails(disease);
                                  },
                                ),
                              );
                            },
                            child: new Text(
                              'View Details',
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: pickImage,
                    child: Container(
                      width: MediaQuery.of(context).size.width - 150,
                      alignment: Alignment.center,
                      padding:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 17),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        'Open Camera',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: pickGalleryImage,
                    child: Container(
                      width: MediaQuery.of(context).size.width - 150,
                      alignment: Alignment.center,
                      padding:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 17),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        'Open Gallery',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class viewdetails extends StatelessWidget {
  String dis;
  viewdetails(String disease) {
    dis = disease;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Details of the disease'),
      ),
      body: new Container(
        child: new Text(
          disease_dic[dis],
        ),
      ),
    );
  }
}
