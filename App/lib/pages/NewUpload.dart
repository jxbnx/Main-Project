import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

import 'package:ml_project/pages/UploadPage.dart';
import '../utils/animations.dart';

import '../data/bg_data.dart';
import '../utils/text_utils.dart';
class NewUpload extends StatefulWidget {
  const NewUpload({super.key});

  @override
  State<NewUpload> createState() => _NewUploadState();
}

class _NewUploadState extends State<NewUpload> {
  int selectedIndex=0;
  bool showOption=false;
  final ImagePicker _picker = ImagePicker();
  XFile? _image;

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    setState(() {
      _image = pickedFile;
    });
  }

  Future<void> _uploadImage() async {
    if (_image == null) return;
    final uri = Uri.parse('http://192.168.22.237:5001/upload');
    final request = http.MultipartRequest('POST', uri)
      ..files.add(await http.MultipartFile.fromPath('file', _image!.path));
    final response = await request.send();
    final responseBody = await response.stream.bytesToString();

    if (response.statusCode == 200) {
      print(responseBody);
      // Additional logic based on response
      if (responseBody == "1") {

        Fluttertoast.showToast(
            msg: "Cercospora Grey Leaf Spot",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
        print("Some Disease");
      }
      else if (responseBody == "2") {

        Fluttertoast.showToast(
            msg: "Corn Common Rust",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
        print("Some Disease");
      }
      else if (responseBody == "3") {

        Fluttertoast.showToast(
            msg: "Corn Healthy",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }
      else if (responseBody == "4") {

        Fluttertoast.showToast(
            msg: "Corn Northern Leaf Blight",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
        print("Some Disease");
      }
      else if (responseBody == "5") {

        Fluttertoast.showToast(
            msg: "Paddy Bacterial Leaf Blight",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
        print("Some Disease");
      }

      else if (responseBody == "6") {

        Fluttertoast.showToast(
            msg: "Paddy Brown Spot",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
        print("Some Disease");
      }
      else if (responseBody == "7") {

        Fluttertoast.showToast(
            msg: "Paddy Healthy",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
        print("Some Disease");
      }
      else if (responseBody == "8") {

        Fluttertoast.showToast(
            msg: "Paddy Leaf Blast",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
        print("Some Disease");
      }
      else if (responseBody == "9") {

        Fluttertoast.showToast(
            msg: "Paddy Leaf Scald",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
        print("Some Disease");
      }
      else if (responseBody == "10") {

        Fluttertoast.showToast(
            msg: "Paddy Narrow Brown Spot",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
        print("Some Disease");
      }
      else if (responseBody == "11") {

        Fluttertoast.showToast(
            msg: "Pepper Bell Bacterial Spot",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
        print("Some Disease");
      }
      if (responseBody == "12") {

        Fluttertoast.showToast(
            msg: "Pepper bell healthy",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
        print("Some Disease");
      }
      if (responseBody == "13") {

        Fluttertoast.showToast(
            msg: "Potato Early Blight",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
        print("Some Disease");
      }

     else if (responseBody == "14") {

        Fluttertoast.showToast(
            msg: "Potato healthy",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
        print("Some Disease");
      }
      else if (responseBody == "15") {

        Fluttertoast.showToast(
            msg: "Potato late blight",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
        print("Some Disease");
      }
      else if (responseBody == "16") {

        Fluttertoast.showToast(
            msg: "soya bean healthy",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
        print("Some Disease");
      }
     else  if (responseBody == "17") {

        Fluttertoast.showToast(
            msg: "Tomato Baterial  Spot",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
        print("Some Disease");
      }
      else if (responseBody == "18") {

        Fluttertoast.showToast(
            msg: "tomato early blight",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
        print("Some Disease");
      }
      else if (responseBody == "19") {

        Fluttertoast.showToast(
            msg: "tomato healthy",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
        print("Some Disease");
      }
     else if (responseBody == "20") {

        Fluttertoast.showToast(
            msg: "tomato late blight",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
        print("Some Disease");
      }

      else if (responseBody == "21") {

        Fluttertoast.showToast(
            msg: "tomato leaf mold",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
        print("Some Disease");
      }

      else if (responseBody == "22") {

        Fluttertoast.showToast(
            msg: "tomato septoria leaf spot",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
        print("Some Disease");
      }
      else if (responseBody == "23") {

        Fluttertoast.showToast(
            msg: "tomato spider mites",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
        print("Some Disease");
      }

      else if (responseBody == "24") {

        Fluttertoast.showToast(
            msg: "tomato target spot",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
        print("Some Disease");
      }

      else if (responseBody == "25") {

        Fluttertoast.showToast(
            msg: "tomato mosaic virus",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
        print("Some Disease");
      }

      else if (responseBody == "26") {

        Fluttertoast.showToast(
            msg: "tomato yellow leaf curl virus",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
        print("Some Disease");
      }


      print('Upload successful');
    } else {
      print('Upload failed');
    }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(

        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration:  BoxDecoration(
            image: DecorationImage(
                image: AssetImage(bgList[selectedIndex]),fit: BoxFit.fill
            ),

          ),
          alignment: Alignment.center,
          child: Container(
            height: 400,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 30),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(15),
              color: Colors.black.withOpacity(0.1),


            ),
            child: ClipRRect(

              borderRadius: BorderRadius.circular(20),
              child: BackdropFilter(filter:ImageFilter.blur(sigmaY: 5,sigmaX: 5),
                  child:Padding(
                    padding: const EdgeInsets.all(25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                      SizedBox(
                      width: 200,  // Specify the width
                      height: 100, // Specify the height
                      child: _image != null
                          ? Image.file(File(_image!.path))
                          : Icon(Icons.image,size: 80,color: Colors.white,), // Specify the path to your dummy image
                    ),

                            ElevatedButton(
                              onPressed: () => _pickImage(ImageSource.gallery),
                              child: Text('Pick Image from Gallery'),
                            ),
                            ElevatedButton(
                              onPressed: () => _pickImage(ImageSource.camera),
                              child: Text('Take a Picture'),
                            ),
                ElevatedButton(
                  onPressed: _uploadImage,
                  child: Text('Upload Image'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.deepPurple, // Background color
                    onPrimary: Colors.white, // Text color
                    minimumSize: Size(double.infinity, 50), // Full width and 50px height
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20), // Rounded corners with radius of 20
                    ),
                  ),
                ),

                          ],
                        )

                      ],
                    ),
                  ) ),
            ),
          ),


        ),



      ),
    );
  }
}
