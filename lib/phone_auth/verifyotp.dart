import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wecare/screens/homescreen.dart';
import 'package:http/http.dart' as http;

import '../reusables.dart';

class Verifyotp extends StatefulWidget {
  final String verificationId;
  const Verifyotp({super.key, required this.verificationId});

  @override
  State<Verifyotp> createState() => _VerifyotpState();
}

class _VerifyotpState extends State<Verifyotp> {
  TextEditingController otpcontroller = TextEditingController();
  bool loading = false;

  void verifyotp() async {
    setState(() {
      loading = true;
    });
    String otp = otpcontroller.text.trim();
    if (otp.length < 6) {
      maketoast(msg: "Otp Length must be 6 Digit", ctx: context);
      setState(() {
        loading = false;
      });
      return;
    }
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: widget.verificationId, smsCode: otp);
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      if (userCredential.user != null) {
        await createAccessToken(userCredential);
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
      maketoast(msg: e, ctx: context);
      setState(() {
        loading = false;
      });
    }
  }

  Future createAccessToken(UserCredential userCredential) async {
    try {
      final mobile = userCredential.user!.phoneNumber!.substring(3);

      final token = userCredential.user!.uid;

      final uri = Uri.parse('https://vcare.aims.96.lt/api/updatetoken');

      final headers = {'Content-Type': 'application/json'};
      Map<String, dynamic> body = {"mobile": mobile, "access_token": token};
      String jsonBody = json.encode(body);
      final encoding = Encoding.getByName('utf-8');

      var response = await http.post(uri,
          headers: headers, body: jsonBody, encoding: encoding);

      if (response.statusCode == 200) {
        Map<String, dynamic> res = jsonDecode(response.body);
        switch (res["code"]) {
          case 200:
            makeSuccesstoast(msg: res["msg"], ctx: context);
            break;
          case 404:
            maketoast(msg: res["msg"], ctx: context);
            break;
          case 500:
            maketoast(msg: res["msg"], ctx: context);
            break;
        }
      } else {
        maketoast(msg: "Server Down", ctx: context);
      }
    } catch (e) {
      maketoast(msg: "Something Went Wrong $e", ctx: context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            "Enter OTP",
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.blue),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80),
            child: TextFormField(
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, letterSpacing: 3),
              onChanged: (v) => setState(() {}),
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              ],
              controller: otpcontroller,
              decoration: getinputstyle(hint: "Enter 6 Digit OTP"),
              maxLength: 6,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Button(context, loading ? "Verifying..." : "Verify OTP",
              () => verifyotp()),
          loading
              ? CircularProgressIndicator(
                  color: Colors.blue,
                )
              : SizedBox(height: 0),
        ]),
      ),
    );
  }

  getinputstyle({required String hint}) {
    return InputDecoration(
        hintText: hint,
        counterText: "",
        prefixIcon: otpcontroller.text.length == 6
            ? Icon(Icons.key)
            : Icon(Icons.key_off),
        prefixIconColor:
            otpcontroller.text.length == 6 ? Colors.blue : Colors.grey,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.purple, width: 2),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.blue),
        ));
  }
}
