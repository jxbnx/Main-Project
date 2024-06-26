import 'package:flutter/material.dart';
import 'package:ml_project/pages/LoginScreen.dart';
import 'package:ml_project/pages/NewUpload.dart';
import 'package:ml_project/pages/UploadPage.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(

        body: NewUpload(),
      ),
    );
  }
}
