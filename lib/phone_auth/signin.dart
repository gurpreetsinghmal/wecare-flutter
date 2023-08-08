import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wecare/phone_auth/verifyotp.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  TextEditingController phonecontroller = TextEditingController();

  void sendotp() async {
    String phone = "+91" + phonecontroller.text.trim();
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
    return Scaffold(
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
