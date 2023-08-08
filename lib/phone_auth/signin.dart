import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wecare/phone_auth/verifyotp.dart';

import '../reusables.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
 
  TextEditingController phonecontroller = TextEditingController();
  bool _c=false;
  void sendotp() async {
    String phone = "+91" + phonecontroller.text.trim();
    if(phonecontroller.text.length<10){
       maketoast(msg:"Invalid Phone Number",ctx: context);
      return;
    }
    else if(!_c){
       maketoast(msg:"Kindly tick Check box",ctx: context);
       return;
    }
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phone,
        codeSent: (verificationId, resendToken) {
          Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (context) => Verifyotp(
                      verificationId: verificationId,
                    )),
          );
        },
        verificationCompleted: (credentials) {},
        verificationFailed: (ex) {
          log(ex.code.toString());
        },
        codeAutoRetrievalTimeout: (verificationId) {},
        timeout: Duration(seconds: 30));
  }

  @override
  Widget build(BuildContext context) {
     double w= MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body:

          SingleChildScrollView(
            child: Container(
              child: Stack(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    width: w,
                    height: h*0.4,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.1, MediaQuery.of(context).size.height*0.17, 0,0),
                      child: Text('Login', textAlign: TextAlign.start, style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
                    ),
                    
                    decoration: const BoxDecoration(
                        color: Colors.blueAccent
                    ),
                  ),

                        Padding(
                          padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.08,MediaQuery.of(context).size.height*0.3,MediaQuery.of(context).size.width*0.08,MediaQuery.of(context).size.height*0.3 ),
                          child: Container(
                            alignment: Alignment.topLeft,
                            decoration:  BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Colors.white,
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    SizedBox(width: 15,height:60,),

                                    Text('Mobile Number', textAlign: TextAlign.start, style: TextStyle(color: Colors.blueAccent, fontSize: 17),),
                                  ],
                                ),
                                SizedBox(height: 0),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: reusableTextField("10 Digit Phone Number", false,  phonecontroller,10),
                                ),
                                SizedBox(height: 20),
                                SizedBox(height: 30),
                                Row(
                                  children: [
                                    SizedBox(height:40,),
                                    Checkbox(value:_c, onChanged:(b){
                                        setState(() {
                                          _c=b??false;
                                        });
                                    }),
                                    Text('I Agree with', textAlign: TextAlign.start, style: TextStyle(color: Colors.black, fontSize: 17),),
                                    GestureDetector(onTap: (){},
                                        child: Text(' the rules', textAlign: TextAlign.start, style: TextStyle(color: Colors.blueAccent, fontSize: 17),)

                                    ),

                                  ],
                                ),
                                SizedBox(height: 0),
                                
                                Button(context, "Send OTP", ()=>sendotp()),



                              
                              ],
                            ),

                          ),
                        ),





                  




                ],
              ),







    ),
          ),
      );
     Scaffold(
      backgroundColor: Colors.blue[50],
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          TextField(
            controller: phonecontroller,
            decoration: InputDecoration(labelText: "Phone Number"),
          ),
          SizedBox(
            height: 20,
          ),
          CupertinoButton(
            child: Text("SignIn"),
            onPressed: sendotp,
            color: Colors.blue,
          )
        ]),
      ),
    );
  }
}
