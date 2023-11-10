import 'dart:async';
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/material/colors.dart';
import 'package:Sujatha/models/patient.dart';
import 'package:Sujatha/reusables.dart';
import 'package:http/http.dart' as http;
import 'package:Sujatha/screens/ASHAScreens/updatepatient.dart';


class ANCPending extends StatefulWidget {
  const ANCPending({super.key});

  @override
  State<ANCPending> createState() => _HomescreenState();
}

class _HomescreenState extends State<ANCPending> {
  bool _shouldGetData = true;
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
  List<Patient> listpats = [];
  List<String> listvnames = [];
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  Future<Map<String, dynamic>> searchRCHorMobile(mob) async {
    var url = Uri.https('vcare.aims.96.lt', '/api/searchpatient');

    final res = await http.post(url, body: {"mobile": mob});
    if (res.statusCode == 200) {
      var jsonData = json.decode(res.body);

      record = jsonData;
      //print(record);
      listpats.clear();
      listvnames.clear();
      if (record["patient"] != null) {
        for (int k = 0; k < record["patient"].length; k++) {
          var p = Patient.fromJson(record["patient"][k]);
          listpats.add(p);
          String v = record["patient"][k]["village"]["name"];
          listvnames.add(v);
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
          _shouldGetData = false;
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
        _shouldGetData = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
                future: _shouldGetData ? getdata() : null, //Only call getdata if _shouldGetData is true
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
              title: Text("Dr. Anil Goyal"),
              subtitle: Text("Reporting CMO"),
            ),
            Divider(),
            ListTile(title: Text("Block"),),
            ListTile(
              leading: Icon(Icons.map_rounded),
              title: Text(_block),),
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
          Center(
            child: Container(
              //width: MediaQuery.of(context).size.width * 0.4, // 40% of screen width
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  singleBoxDesign(Icons.person_add, "10\nTotal ANC Pending"),
                ],
              ),
            ),
          ),
          Divider(),
          /*Column(   //This is box type view with two box in one row
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 18),
                            child: boxDesign(Icons.person_add, "50\n\nTotal ANC"),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 18),
                            child: boxDesign(Icons.person_add, "10\n \nPending ANC"),
                          ),
                        ),
                      ],
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 18),
                            child: boxDesign(Icons.person_add, "30\n\nTotal Deleiveries"),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 18),
                            child: boxDesign(Icons.person_add, "10 \nDeleiveries status\nPending"),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),*/
          customRow(
            Icons.person_add,
            "Total ANC",
            "50",
            size,
            bgColor: Colors.green[200],
            onTap: () {
              // Your code to handle the tap event goes here
            },
          ),

          Card(
            elevation: 0,
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () {
                splashRadius: 30;
                /*Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              SMOHomescreen(),
                        ),
                      );*/
                // Your code to handle the tap event goes here
              },
              child: customRow(
                Icons.person_add,
                "Pending ANC",
                "10",
                size,
                bgColor: Colors.red[300],
              ),
            ),
          ),

          customRow(
            Icons.person_add,
            "Total Deleiveries",
            "30",
            size,
            bgColor: Colors.green[200],
            onTap: () {
              // Your code to handle the tap event goes here
            },
          ),

          Card(
            elevation: 0,
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () {
                // Your code to handle the tap event goes here
              },
              child: customRow(
                Icons.person_add,
                "Deleiveries status Pending",
                "10",
                size,
                bgColor: Colors.red[300],
              ),
            ),
          ),
          /*Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(
                          top: 20,
                          left: 25,
                          right: 25,
                        ),
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                color: grey.withOpacity(0.03),
                                spreadRadius: 10,
                                blurRadius: 3,
                                // changes position of shadow
                              ),
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 10, bottom: 10, right: 20, left: 20),
                          child: Row(
                            children: [
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: arrowbgColor,
                                  borderRadius: BorderRadius.circular(15),
                                  // shape: BoxShape.circle
                                ),
                                child: Center(
                                    child: Icon(Icons.arrow_upward_rounded)),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                child: Container(
                                  width: (size.width - 90) * 0.7,
                                  child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Sent",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "Sending Payment to Clients",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: black.withOpacity(0.5),
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ]),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        "\$150",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: black),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),*/


          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 80,
              ),
              Text(
                "ਲਿੰਗ ਨਿਰਧਾਰਣ ਕਾਨੂੰਨੀ ਅਪਰਾਧ ਹੈ।",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              Text(
                "Sex determination is a legal offense.",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "(Health Team district Faridkot)",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
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
                                    maxLength: 10,
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
                                    patients: listpats, vnames: listvnames)
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

  MyListViewPatient({required this.patients, required this.vnames});

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
                            UpdatePatient(patients[index], vnames[index])));
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