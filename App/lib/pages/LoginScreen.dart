import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ml_project/pages/NewUpload.dart';
import 'package:ml_project/pages/UploadPage.dart';
import '../utils/animations.dart';

import '../data/bg_data.dart';
import '../utils/text_utils.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  int selectedIndex=0;
  bool showOption=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

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
                      const   Spacer(),
                      Center(child: TextUtil(text: "Login",weight: true,size: 30,)),
                      const   Spacer(),
                      TextUtil(text: "Email",),
                      Container(
                        height: 35,
                        decoration:const  BoxDecoration(
                            border: Border(bottom: BorderSide(color: Colors.white))
                        ),
                        child:TextFormField(
                          style: const TextStyle(color: Colors.white),
                          decoration:const  InputDecoration(
                            suffixIcon: Icon(Icons.mail,color: Colors.white,),
                            fillColor: Colors.white,
                            border: InputBorder.none,),
                        ),
                      ),
                      const   Spacer(),
                      TextUtil(text: "Password",),
                      Container(
                        height: 35,
                        decoration:const  BoxDecoration(
                            border: Border(bottom: BorderSide(color: Colors.white))
                        ),
                        child:TextFormField(
                          style: const TextStyle(color: Colors.white),
                          decoration:const  InputDecoration(
                            suffixIcon: Icon(Icons.lock,color: Colors.white,),
                            fillColor: Colors.white,
                            border: InputBorder.none,),
                        ),
                      ),
                      const   Spacer(),
                      Row(
                        children: [

                          const  SizedBox(width: 10,),
                        ],
                      ), const   Spacer(),
                      GestureDetector(
                        onTap: (){
                          print("hello");

                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => NewUpload()),
                          );

                        },
                        child: Container(
                          height: 40,
                          width: double.infinity,
                          decoration:  BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30)
                          ),
                          alignment: Alignment.center,
                          child: TextUtil(text: "Log In",color: Colors.black,),
                        ),
                      ),
                      const   Spacer(),


                    ],
                  ),
                ) ),
          ),
        ),


      ),



    );
  }
}