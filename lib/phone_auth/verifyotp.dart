import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wecare/screens/homescreen.dart';

class Verifyotp extends StatefulWidget {
  final String verificationId;
  const Verifyotp({super.key, required this.verificationId});

  @override
  State<Verifyotp> createState() => _VerifyotpState();
}

class _VerifyotpState extends State<Verifyotp> {
  TextEditingController otpcontroller = TextEditingController();

  void maketoast(String s) {
    var snackBar = SnackBar(
      content: Text(s),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void verifyotp() async {
    String otp = otpcontroller.text.trim();
    if (otp.length < 6) {
      maketoast("Otp Length must be 6 Digit");
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
      maketoast(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          TextField(
            controller: otpcontroller,
            decoration: InputDecoration(labelText: "Enter 6 digit OTP"),
            maxLength: 6,
          ),
          SizedBox(
            height: 20,
          ),
          CupertinoButton(
            child: Text("Verify Otp"),
            onPressed: verifyotp,
            color: Colors.blue,
          )
        ]),
      ),
    );
  }
}
