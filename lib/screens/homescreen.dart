import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wecare/phone_auth/signin.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {


  String _mobile = "";
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    _fetchUserPhoneNumber();
  }

  Future<void> _fetchUserPhoneNumber() async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        _mobile = user.phoneNumber ?? 'Phone number not available';
      }
    } catch (e) {
      print('Error fetching user phone number: $e');
    }
    setState(() {}); // Update the UI with the retrieved phone number
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

  @override
  Widget build(BuildContext context) {
   

    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 30,
                  child: Icon(Icons.person,size: 30,),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                  "Name",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                Text(
                  "User Type",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 15,
                  ),
                ),
                  ],
                )
                
              ],
            ),
          ),
            ListTile(
              leading: Icon(Icons.home),
            )
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Home"),
        actions: [
          IconButton(onPressed: () => logout(), icon: Icon(Icons.exit_to_app))
        ],
      ),
    );
  }
}
