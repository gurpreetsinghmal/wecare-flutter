import 'dart:async';
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wecare/models/patient.dart';
import 'package:wecare/phone_auth/signin.dart';
import 'package:wecare/reusables.dart';
import 'package:http/http.dart' as http;
import 'package:wecare/screens/ASHAScreens/addpatient.dart';
import 'package:wecare/screens/ASHAScreens/updatepatient.dart';

import '../ANMScreens/updatescreen.dart';

class ASHAHomescreen extends StatefulWidget {
  const ASHAHomescreen({super.key});

  @override
  State<ASHAHomescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<ASHAHomescreen> {
  String _name = "";
  String _mobile = "";
  String _role = "";
  String _district = "";
  String _distcode = "";
  String _block = "";
  String _anm = "";
  String _blockcode = "";
  Map<String, dynamic>? village;
  String _profileimg = "";
  int _index = 0;
  Map<String, dynamic> record = {};
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  Future<Map<String, dynamic>> searchRCHorMobile(mob) async {
    var url = Uri.https('vcare.aims.96.lt', '/api/searchpatient');

    final res = await http.post(url, body: {"mobile": mob});
    if (res.statusCode == 200) {
      var jsonData = json.decode(res.body);

      record = jsonData;
    } else {
      record = {"code": "500", "msg": "api error"};
    }

    return record;
  }

  Future<void> getdata() async {
    try {
      final token = FirebaseAuth.instance.currentUser!.uid;
      var url = Uri.https(
          'vcare.aims.96.lt', '/api/getAshaProfile', {'access_token': token});

      var response = await http.get(url);
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = jsonDecode(response.body);
        if (jsonResponse.containsKey("code")) {
          maketoast(msg: jsonResponse["msg"], ctx: context);
        } else if (jsonResponse.containsKey("id")) {
          _name = jsonResponse["name"];
          _mobile = jsonResponse["mobile"];
          _role = jsonResponse["role"] ?? "NA";
          _district = jsonResponse["dist_name"] ?? "NA";
          _distcode = jsonResponse["dist_code"].toString();
          _block = jsonResponse["block_name"] ?? "NA";
          _blockcode = jsonResponse["block_code"].toString();
          _anm = jsonResponse["anm"] ?? "NA";
          village = jsonResponse["villages"];
          _profileimg = jsonResponse["photo"];
        }
      } else {}
    } catch (e) {
      maketoast(msg: "exception:${e.toString()}", ctx: context);
    }
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

  final mytextstyle = const TextStyle(
      color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold);

  bool loaded = false;
  final SearchController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata().then((value) {
      setState(() {
        loaded = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    return !loaded
        ? Center(
            child: CircularProgressIndicator(
              color: Colors.blue,
            ),
          )
        : Scaffold(
            key: _scaffoldKey,
            drawer: Drawer(
              child: ListView(
                children: [
                  Container(
                    decoration: BoxDecoration(color: Colors.blue),
                    padding: EdgeInsets.all(10),
                    child: FutureBuilder(
                      future: getdata(),
                      builder: ((context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                              child: CircularProgressIndicator(
                            color: Colors.white,
                          ));
                        } else {
                          return Center(
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CircleAvatar(
                                    radius: 30,
                                    backgroundImage: NetworkImage(_profileimg),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      _name,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      _mobile,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Text(
                                      _role,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        }
                      }),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text(_anm),
                    subtitle: Text("Reporting ANM"),
                  ),
                  Divider(),
                  ListTile(title: Text("Coverage Area"),),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: village!.values.toList().length,
                      itemBuilder:(context,i){
                          return ListTile(
                              leading: Icon(Icons.map_rounded),
                              title:Text(village!.values.toList()[0]));
                      })
                ],
              ),
            ),
            appBar: AppBar(
              backgroundColor: Colors.blue,
              title: Text("Dashboard"),
              actions: [
                IconButton(
                    onPressed: () => {
                          showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return SizedBox(
                                  height: 400,
                                  child: Padding(
                                    padding: const EdgeInsets.all(18.0),
                                    child: Column(
                                      children: [
                                        Text("Search"),
                                        Form(
                                          key: _formkey,
                                          child: StatefulBuilder(builder:
                                              (context, StateSetter setState) {
                                            return Column(
                                              children: [
                                                TextFormField(
                                                  controller: SearchController,
                                                  decoration: InputDecoration(
                                                      labelText:
                                                          "Enter Mobile / RCH ID"),
                                                  validator: (v) {
                                                    if (v == null ||
                                                        v.isEmpty) {
                                                      return "Enter Search Value";
                                                    }
                                                    return null;
                                                  },
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                CupertinoButton(
                                                    color: Colors.blue,
                                                    onPressed: () async {
                                                      if (_formkey.currentState!
                                                          .validate()) {
                                                        if (SearchController
                                                                .text.length >
                                                            0) {
                                                          final data =
                                                              SearchController
                                                                  .text
                                                                  .trim();

                                                          var res =
                                                              await searchRCHorMobile(
                                                                  data);
                                                          if (res.isNotEmpty) {
                                                            SearchController
                                                                .clear();
                                                          } else {
                                                            maketoast(
                                                                msg:
                                                                    "No Record Found",
                                                                ctx: context);
                                                          }
                                                          // Navigator.pop(context);

                                                          setState(() {
                                                            loaded = true;
                                                          });
                                                        }
                                                      }
                                                    },
                                                    child: Text("Search")),
                                                SizedBox(height: 10),

                                                // record.isEmpty?SizedBox(width:1):
                                                record["code"] == 200
                                                    ? ListTile(
                                                        onTap: () {
                                                          Map<String, dynamic>
                                                              x =
                                                              (record["patient"]
                                                                      [0])
                                                                  as Map<String,
                                                                      dynamic>;
                                                          String villagename =
                                                              x["village"]
                                                                  ["name"];
                                                          // x.remove('village');
                                                          // print(json.encode(x));
                                                          Patient p =
                                                              patientFromJson(
                                                                  json.encode(
                                                                      x));

                                                          Navigator.pop(
                                                              context);
                                                          record.clear();
                                                          Navigator.push(
                                                              context,
                                                              CupertinoPageRoute(
                                                                  builder: (context) =>
                                                                      UpdatePatient(
                                                                          p,
                                                                          villagename)));
                                                        },
                                                        leading:
                                                            Icon(Icons.person),
                                                        trailing: Text(
                                                          record["patient"][0][
                                                                      "village"]
                                                                  ["name"]
                                                              .toString(),
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                        iconColor: Colors.white,
                                                        tileColor: Colors.blue,
                                                        title: Text(
                                                          record["patient"][0]
                                                                  ["name"]
                                                              .toString()
                                                              .toUpperCase(),
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      )
                                                    : Text(record["msg"] ?? "")
                                              ],
                                            );
                                          }),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              })
                        },
                    icon: Icon(Icons.search)),
                IconButton(
                    onPressed: () => logout(), icon: Icon(Icons.exit_to_app))
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: _index,
              selectedItemColor: Colors.blue[800],
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: "Profile"),
              ],
              onTap: (i) {
                setState(() {
                  _index = i;
                  if(_index==1){
                    _scaffoldKey.currentState!.openDrawer();
                  }
                  else{
                    _scaffoldKey.currentState!.closeDrawer();
                  }
                });
              },
            ),
            body: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "District : $_district",
                      style: mytextstyle,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Block : $_block",
                      style: mytextstyle,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                AddNewPatient(_distcode.toString(), _blockcode.toString()),
                          ),
                        );
                      },
                      child: btncard(Icons.person_add, "Add Patient"),
                    ),
                    InkWell(
                      onTap: () {

                          showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return SizedBox(
                                  height: 400,
                                  child: Padding(
                                    padding: const EdgeInsets.all(18.0),
                                    child: Column(
                                      children: [
                                        Text("Search"),
                                        Form(
                                          key: _formkey,
                                          child: StatefulBuilder(builder:
                                              (context, StateSetter setState) {
                                            return Column(
                                              children: [
                                                TextFormField(
                                                  controller: SearchController,
                                                  decoration: InputDecoration(
                                                      labelText:
                                                      "Enter Mobile / RCH ID"),
                                                  validator: (v) {
                                                    if (v == null ||
                                                        v.isEmpty) {
                                                      return "Enter Search Value";
                                                    }
                                                    return null;
                                                  },
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                CupertinoButton(
                                                    color: Colors.blue,
                                                    onPressed: () async {
                                                      if (_formkey.currentState!
                                                          .validate()) {
                                                        if (SearchController
                                                            .text.length >
                                                            0) {
                                                          final data =
                                                          SearchController
                                                              .text
                                                              .trim();

                                                          var res =
                                                          await searchRCHorMobile(
                                                              data);
                                                          if (res.isNotEmpty) {
                                                            SearchController
                                                                .clear();
                                                          } else {
                                                            maketoast(
                                                                msg:
                                                                "No Record Found",
                                                                ctx: context);
                                                          }
                                                          // Navigator.pop(context);

                                                          setState(() {
                                                            loaded = true;
                                                          });
                                                        }
                                                      }
                                                    },
                                                    child: Text("Search")),
                                                SizedBox(height: 10),

                                                // record.isEmpty?SizedBox(width:1):
                                                record["code"] == 200
                                                    ? ListTile(
                                                  onTap: () {
                                                    Map<String, dynamic>
                                                    x =
                                                    (record["patient"]
                                                    [0])
                                                    as Map<String,
                                                        dynamic>;
                                                    String villagename =
                                                    x["village"]
                                                    ["name"];
                                                    // x.remove('village');
                                                    // print(json.encode(x));
                                                    Patient p =
                                                    patientFromJson(
                                                        json.encode(
                                                            x));

                                                    Navigator.pop(
                                                        context);
                                                    record.clear();
                                                    Navigator.push(
                                                        context,
                                                        CupertinoPageRoute(
                                                            builder: (context) =>
                                                                UpdatePatient(
                                                                    p,
                                                                    villagename)));
                                                  },
                                                  leading:
                                                  Icon(Icons.person),
                                                  trailing: Text(
                                                    record["patient"][0][
                                                    "village"]
                                                    ["name"]
                                                        .toString(),
                                                    style: TextStyle(
                                                        color:
                                                        Colors.white),
                                                  ),
                                                  iconColor: Colors.white,
                                                  tileColor: Colors.blue,
                                                  title: Text(
                                                    record["patient"][0]
                                                    ["name"]
                                                        .toString()
                                                        .toUpperCase(),
                                                    style: TextStyle(
                                                        color:
                                                        Colors.white),
                                                  ),
                                                )
                                                    : Text(record["msg"] ?? "")
                                              ],
                                            );
                                          }),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              });

                      },
                      child: btncard(Icons.edit_calendar, "Update Patient"),
                    ),
                  ],
                ),
              ],
            ),
          );
  }
}
