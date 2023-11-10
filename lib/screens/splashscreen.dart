import 'dart:convert';

import 'package:Sujatha/screens/SMOScreens/smohome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Sujatha/screens/ANMScreens/anmhome.dart';
import 'package:Sujatha/screens/ASHAScreens/ashahome.dart';
import 'package:Sujatha/screens/GDMOScreens/gdmohome.dart';
import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

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
  String link="";
  String version="";
  String current_version="";
  @override
  void initState() {
    fetchData();
    super.initState();


  }

//   dd(){
//     // Fetch the current_app_version parameter from Firebase Remote Config
//     FirebaseRemoteConfig mFirebaseRemoteConfig = FirebaseRemoteConfig.getInstance();
//     mFirebaseRemoteConfig.fetchAndActivate()
//         .addOnCompleteListener(this, task -> {
//     if (task.isSuccessful()) {
//     String latestVersion = mFirebaseRemoteConfig.getString("current_app_version");
//     String currentVersion = BuildConfig.VERSION_NAME;
//
//     if (compareVersions(currentVersion, latestVersion) < 0) {
//     // Show a dialog or prompt the user to update the app
//     // You can use an Intent to open the Play Store for the app.
//     }
//     }
//     });
//
// // Function to compare version strings
//     public int compareVersions(String v1, String v2) {
//       String[] parts1 = v1.split("\\.");
//       String[] parts2 = v2.split("\\.");
//
//       int minLength = Math.min(parts1.length, parts2.length);
//
//       for (int i = 0; i < minLength; i++) {
//         int compare = Integer.compare(Integer.parseInt(parts1[i]), Integer.parseInt(parts2[i]));
//         if (compare != 0) {
//           return compare;
//         }
//       }
//
//       return Integer.compare(parts1.length, parts2.length);
//     }
//
//   }

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



  void navigateToNextScreen(int roleId) async{
    Widget nextScreen;
    print(roleId);
    if (roleId == 1) {
      nextScreen = ASHAHomescreen();
    } else if (roleId == 2) {
      nextScreen = ANMHomescreen();
    }else if (roleId == 3) {
      nextScreen = GDMOHomescreen();
    } else if (roleId == 5) {
      nextScreen = SMOHomescreen();
    }
    else {
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
                  'An Initiative of Health Department',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                SizedBox(height: 10),
                Text(
                  'powered by District Adminsitration Faridkot',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                SizedBox(height: 50),
                Text(
                  'App Version : '+ version,
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
    try {
      final FirebaseRemoteConfig remoteConfig =
          FirebaseRemoteConfig.instance;
      // Using zero duration to force fetching from remote server.
      await remoteConfig.setConfigSettings(
        RemoteConfigSettings(
          fetchTimeout: const Duration(seconds: 10),
          minimumFetchInterval: Duration.zero,
        ),
      );
      await remoteConfig.fetchAndActivate();
      current_version=remoteConfig.getString('current_app_sujatha_version');
      link=remoteConfig.getString('app_update_url');
      PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
        String appName = packageInfo.appName;
        String packageName = packageInfo.packageName;
        String buildNumber = packageInfo.buildNumber;
          setState(() {
            version = packageInfo.version;
          });
      });

    } on PlatformException catch (exception) {
      // Fetch exception.
      print(exception);
      print( 'Exception: $exception');
    } catch (exception) {
      print(exception);
      print( 'Unable to fetch remote config. Cached or default values will be '
          'used');
    }
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
        if(version!=current_version){
          getupdate();
        }
        else {
          navigateToNextScreen(user.roleId);
        }
      } else {
        maketoast(msg: "Server down", ctx: context);
      }
    } else {
      if(version!=current_version){
        getupdate();
      }
      else {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) =>
                Loginscreen()), (Route<dynamic> route) => false);
      }
    }
  }

  getupdate(){
    return  showDialog(
      context: context,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => false, // Disable back button
          child: SimpleDialog(
            contentPadding: EdgeInsets.all(16),
            children: <Widget>[
              Text(
                'Kindly update your App',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Redirect to a link
                  launchURL(link);
                  Navigator.of(context).pop(); // Close the dialog after redirection
                },
                child: Text('Update Now'),
              ),
            ],
          ),
        );
      },
      barrierDismissible: false, // Prevent dismissing by tapping outside
    );
  }
  void launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

