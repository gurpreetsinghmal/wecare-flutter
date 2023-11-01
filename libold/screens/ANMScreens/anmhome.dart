import 'dart:async';
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Sujatha/models/patient.dart';
import 'package:Sujatha/reusables.dart';
import 'package:http/http.dart' as http;
import 'package:Sujatha/screens/ANMScreens/patientsections.dart';

class ANMHomescreen extends StatefulWidget {
  const ANMHomescreen({super.key});

  @override
  State<ANMHomescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<ANMHomescreen> {
  String _name = "";
  String _mobile = "";
  String _role = "";
  String _district = "";
  // String _distcode="";
  String _block = "";
  String _smo = "";
   // String _blockcode = "";
  List ashas = [];
  String _profileimg = "";
  int _index = 0;
  Map<String, dynamic> record = {};
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  List<Patient> listpats = [];
  List<String> listvnames = [];
  List<String> listashanames = [];
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  Future<Map<String, dynamic>> searchRCHorMobile(mob) async {
    var url = Uri.https('vcare.aims.96.lt', '/api/searchpatient');

    final res = await http.post(url, body: {"mobile": mob});
    if (res.statusCode == 200) {
      var jsonData = json.decode(res.body);

      record = jsonData;
      listpats.clear();
      listvnames.clear();
      listashanames.clear();
      if (record["patient"] != null) {
        for (int k = 0; k < record["patient"].length; k++) {
          var p = Patient.fromJson(record["patient"][k]);
          listpats.add(p);
          String v = record["patient"][k]["village"]["name"];
          listvnames.add(v);
          String a = record["patient"][k]["asha"]["name"];
          listashanames.add(a);

        }
      }
    } else {
      record = {"code": "500", "msg": "api error"};
    }

    return record;
  }

  Future<void> getdata() async {
    try {
      final token = FirebaseAuth.instance.currentUser!.uid;
      var url = Uri.https(
          'vcare.aims.96.lt', '/api/getAnmProfile', {'access_token': token});
      print(token);
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
          // _distcode = jsonResponse["dist_code"].toString();
          _block = jsonResponse["block_name"] ?? "NA";
          // _blockcode = jsonResponse["block_code"].toString();
          _smo = jsonResponse["smo"] ?? "NA";
          _profileimg = jsonResponse["photo"];

          Map<String, dynamic>? a = jsonResponse["ashas"];
          ashas = [];
          a!.forEach((key, value) {
            var data = {"ashaid": key, "ashaname": value.toString()};
            ashas.add(data);
          });
        }
      } else {}
    } catch (e) {
      maketoast(msg: "exception:${e.toString()}", ctx: context);
    }
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
              child: Column(
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
                                    child: Icon(Icons.admin_panel_settings, color: Colors.blue,size: 30,),

                                    // backgroundImage: NetworkImage(_profileimg),
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
                    title: Text(_smo),
                    subtitle: Text("Reporting SMO"),
                  ),
                  Divider(),
                  ListTile(
                    title: Text("Incharge of Asha's"),
                  ),
                  Flexible(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: ashas.length,
                        itemBuilder: (context, i) {
                          print(i);
                          return ListTile(
                              leading: Icon(Icons.map_rounded),
                              title: Text(ashas[i]["ashaname"]));
                        }),
                  )
                ],
              ),
            ),
            appBar: AppBar(
              backgroundColor: Colors.blue,
              title: Text("Dashboard"),
              actions: [
                IconButton(onPressed: callbottom, icon: Icon(Icons.search)),
                IconButton(
                    onPressed: () => showLogoutConfirmationDialog(context), icon: Icon(Icons.exit_to_app))
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
                  if (_index == 1) {
                    _scaffoldKey.currentState!.openDrawer();
                  } else {
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
                    // InkWell(
                    //   onTap: () {
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //         builder: (context) =>
                    //             AddNewPatient(_distcode.toString(), _blockcode.toString()),
                    //       ),
                    //     );
                    //   },
                    //   child: btncard(Icons.person_add, "Add Patient"),
                    // ),
                    InkWell(
                      onTap: callbottom,
                      child: btncard(Icons.edit_calendar, "Update Patient"),
                    ),
                  ],
                ),
              ],
            ),
          );
  }

  Future callbottom() {
    listpats.clear();
    return showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          // Set the fixed height of the bottom sheet here
          final sheetHeight = 400.0;

          return Container(
            height: sheetHeight,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Form(
                      key: _formkey,
                      child: StatefulBuilder(
                          builder: (context, StateSetter setState) {
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                controller: SearchController,
                                decoration: InputDecoration(
                                    labelText: "Enter Mobile / RCH ID"),
                                validator: (v) {
                                  if (v == null || v.isEmpty) {
                                    return "Enter Search Value";
                                  }
                                  return null;
                                },
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            CupertinoButton(
                                color: Colors.blue,
                                onPressed: () async {
                                  if (_formkey.currentState!.validate()) {
                                    if (SearchController.text.length > 0) {
                                      final data = SearchController.text.trim();

                                      var res = await searchRCHorMobile(data);
                                      if (res.isNotEmpty) {
                                        SearchController.clear();
                                      } else {
                                        maketoast(
                                            msg: "No Record Found",
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
                            record["code"] == 200
                                ? MyListViewPatient(
                                    patients: listpats, vnames: listvnames,ashanames:listashanames,)
                                : record["code"] == 404
                                    ? Text(record["msg"])
                                    : Text("")
                          ],
                        );
                      })),
                ],
              ),
            ),
          );
        });
  }
}

class MyListViewPatient extends StatelessWidget {
  final List<Patient> patients;
  final List<String> vnames;
  final List<String> ashanames;

  MyListViewPatient({required this.patients, required this.vnames,required this.ashanames});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: patients.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: Colors
                  .blue[300], // Replace with your desired background color
              borderRadius:
                  BorderRadius.circular(10.0), // Set the border radius here
            ),
            margin: EdgeInsets.all(3),
            child: ListTile(
              onTap: () {
                Navigator.pop(context);

                Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) =>
                            PatientSections(patients[index], vnames[index],ashanames[index])));
              },
              leading: Icon(Icons.person),
              trailing: Text(
                vnames[index].toString(),
                style: TextStyle(color: Colors.white),
              ),
              iconColor: Colors.white,
              textColor: Colors.white,
              title: Text(patients[index].name.toString().toUpperCase()),
              subtitle:
                  Text(patients[index].husbandName.toString().toUpperCase()),
              // You can add more properties or customize ListTile as needed
            ),
          );
        },
      ),
    );
  }
}
