import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wecare/screens/homescreen.dart';

import '../reusables.dart';

class Verifyotp extends StatefulWidget {
  final String verificationId;
  const Verifyotp({super.key, required this.verificationId});

  @override
  State<Verifyotp> createState() => _VerifyotpState();
}

class _VerifyotpState extends State<Verifyotp> {
  TextEditingController otpcontroller = TextEditingController();

  

  void verifyotp() async {
    String otp = otpcontroller.text.trim();
    if (otp.length < 6) {
      maketoast(msg: "Otp Length must be 6 Digit",ctx: context);
      return;
    }
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: widget.verificationId, smsCode: otp);
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      if (userCredential.user != null) {
        Navigator.popUntil(context, (route) => route.isFirst);
        Navigator.pushReplacement(
          context,
          CupertinoPageRoute(
            builder: (context) => Homescreen(),
          ),
        );
      }
    } on FirebaseAuthException catch (ex) {
      String e = ex.code.toString();
       maketoast(msg:e,ctx: context);
     
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text("Enter OTP",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.blue ),),
          
          TextField(
            controller: otpcontroller,
            decoration: InputDecoration(labelText: "Enter 6 digit OTP"),
            maxLength: 6,
          ),
          SizedBox(
            height: 20,
          ),
          Button(context, "Verify OTP", ()=>verifyotp()),
        
        ]),
      ),
    );
  }
}
