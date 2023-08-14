import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../phone_auth/signin.dart';
import 'homescreen.dart';
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHomeScreen();
  }

  // Simulate an initialization process with a delay
  Future<void> _navigateToHomeScreen() async {
    await Future.delayed(Duration(seconds: 3));
    
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => (FirebaseAuth.instance.currentUser != null)
          ? const Homescreen()
          : const Loginscreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Stack(
        fit: StackFit.expand,
        children: [
         
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                 CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('asset/images/wecare.png'),
                 ),
                 SizedBox(height:20),
                Text(
                  'Welcome to Wecare',
                  style: TextStyle(fontSize: 20,color: Colors.white),
                ),
                SizedBox(height: 20),
                CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
                SizedBox(height: 70),
                Text(
                  'An Initiative of District Adminsitration Faridkot ',
                  style: TextStyle(fontSize: 15,color: Colors.white),
                ),
                Text(
                  'powered by NIC Faridkot',
                  style: TextStyle(fontSize: 15,color: Colors.white),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}