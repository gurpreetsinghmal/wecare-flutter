import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:Sujatha/phone_auth/verifyotp.dart';
import 'package:http/http.dart' as http;

import '../reusables.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {

  TextEditingController phonecontroller = TextEditingController();
  bool _c = false;
  bool loading = false;

  void sendotp() async {
    print("Data");
    setState(() {
      loading = true;
    });
    String phone = "+91${phonecontroller.text.trim()}";
    if (phonecontroller.text.length < 10) {
      maketoast(msg: "Invalid Phone Number", ctx: context);
      setState(() {
        loading = false;
      });
      return;
    } else if (!_c) {
      maketoast(msg: "Kindly Agree the rules by opting checkbox", ctx: context);
      setState(() {
        loading = false;
      });
      return;
    }
    var p = phonecontroller.text;

    bool u = await userCheckExsist(pctx: context, phone: p);
    if (u) {
      proceedSms(phone);
    } else {
      print("failed");
      setState(() {
        loading = false;
      });
    }
  }

  void proceedSms(phone) async {
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
          maketoast(msg: ex.toString(), ctx: context);
        },
        codeAutoRetrievalTimeout: (verificationId) {},
        timeout: const Duration(seconds: 30));
  }

  Future<bool> userCheckExsist({pctx, phone}) async {
    try {
      var url = Uri.https('vcare.aims.96.lt', '/api/genotp', {'mobile': phone});

      var response = await http.get(url);
      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        switch (json["code"]) {
          case 200:
            return true;
          case 404:
            maketoast(msg: json["msg"], ctx: pctx);
            break;
          case 500:
            maketoast(msg: json["msg"], ctx: pctx);
            break;
        }
      } else {
        maketoast(msg: "Server Down", ctx: pctx);
      }
    } catch (e) {
      maketoast(msg: "Something Went Wrong $e", ctx: pctx);
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.grey[200],
          child:
          Stack(
            children: [
              Container(
                alignment: Alignment.topLeft,
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 2,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height / 8,
                      horizontal: 20.0),
                  child: Text(
                    'Login',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                decoration: BoxDecoration(color: Colors.blueAccent),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                     vertical: MediaQuery.of(context).size.height / 4.5,
                    horizontal: 20.0),
                child: Container(
                  alignment: Alignment.topLeft,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(color: Colors.black, blurRadius: 10.0)
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 15,
                            height: 60,
                          ),
                          Text(
                            'Mobile Number',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Colors.blueAccent, fontSize: 17),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 3),
                          controller: phonecontroller,
                          maxLength: 10,
                          keyboardType: TextInputType.phone,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          ],
                          onChanged: (v) => setState(() {}),
                          decoration:
                              getinputstyle(hint: "Enter Mobile Number"),
                        ),
                      ),
                      SizedBox(height: 20),
                      ListTile(
                        leading: Checkbox(
                            activeColor: Colors.blue,
                            value: _c,
                            onChanged: (b) {
                              setState(() {
                                _c = b ?? false;
                              });
                            }),
                        title: InkWell(
                          onTap: () {
                            setState(() {
                              _c = !_c;
                            });
                          },
                          child: Text("I Agree with the rules"),
                        ),
                      ),
                      SizedBox(height: 30),
                      // TextButton(
                      //
                      //   onPressed: sendotp,
                      //   child: Text('Looks like a FlatButton'),
                      // ),
                      Button(context, loading ? "Sending..." : "Send OTP",
                          sendotp),
                      loading
                          ? CircularProgressIndicator(
                              color: Colors.blue,
                            )
                          : SizedBox(height: 0),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  getinputstyle({required String hint}) {
    return InputDecoration(
        hintText: hint,
        counterText: "",
        prefixIcon: phonecontroller.text.length == 10
            ? Icon(Icons.mobile_friendly_outlined)
            : Icon(Icons.mobile_off),
        prefixIconColor:
            phonecontroller.text.length == 10 ? Colors.blue : Colors.grey,
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
