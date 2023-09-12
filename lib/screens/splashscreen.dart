import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Sujatha/screens/ANMScreens/anmhome.dart';
import 'package:Sujatha/screens/ASHAScreens/ashahome.dart';
import 'package:Sujatha/screens/GDMOScreens/gdmohome.dart';

import '../phone_auth/signin.dart';
import '../reusables.dart';

import 'package:http/http.dart' as http;

class User {
  final String name;
  final int roleId;
  User({required this.name, required this.roleId});
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late User user;


  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void logout() async {
    await FirebaseAuth.instance.signOut();
    Navigator.popUntil(context, (route) => route.isFirst);
    Navigator.pushReplacement(
      context,
      CupertinoPageRoute(
        builder: (context) => Loginscreen(),
      ),
    );
  }



  void navigateToNextScreen(int roleId) {
    Widget nextScreen;
    print(roleId);
    if (roleId == 1) {
      nextScreen = ASHAHomescreen();
    } else if (roleId == 2) {
      nextScreen = ANMHomescreen();
    }else if (roleId == 3) {
      nextScreen = GDMOHomescreen();
    } else {
      maketoast(msg: "No Role Assigned", ctx: context);
      logout();
      return;
    }

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => nextScreen),
    );
  }



  @override
  Widget build(BuildContext context) {
    // fetchData();
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.pink.shade50, // Border color
                      width: 4.0, // Border width
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.grey,
                      backgroundImage: AssetImage('asset/images/logo.png'),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                RichText(
                  text:TextSpan(
                    children: [
                      TextSpan(text:"Welcome to ",style: TextStyle(fontSize: 20, color: Colors.white,fontWeight: FontWeight.bold)),
                      TextSpan(text:"Sujatha",style: TextStyle(fontSize: 20, color: Colors.white,fontWeight: FontWeight.bold))
                    ]
                  ),
                ),
                SizedBox(height: 70),
                CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
                SizedBox(height: 20),
                Text(
                  'An Initiative of District Adminsitration Faridkot ',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                Text(
                  'powered by NIC Faridkot',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }

  void fetchData() async {
    await Future.delayed(Duration(seconds: 3));
    final userUid = FirebaseAuth.instance.currentUser?.uid;
    if (userUid != null) {
      // Fetch access_token using userUid from your database or Firebase
      final access_token = userUid;

      final response = await http.get(Uri.parse(
          'https://vcare.aims.96.lt/api/getUserRole?access_token=$access_token'));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final userJson = jsonData['user'];
        user = User(
          name: userJson['name'],
          roleId: userJson['role_id'],
        );
        navigateToNextScreen(user.roleId);
      } else {
        maketoast(msg: "Server down", ctx: context);
      }
    } else {
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
          Loginscreen()), (Route<dynamic> route) => false);
    }
  }
}
