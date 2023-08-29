import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wecare/models/patient.dart';
import 'package:wecare/reusables.dart';
import 'package:http/http.dart' as http;

class UpdatePatient extends StatefulWidget {
  final Patient p;
  final villagename;
  const UpdatePatient(this.p,this.villagename, {super.key});

  @override
  State<UpdatePatient> createState() => _UpdatePatientState();
}

class _UpdatePatientState extends State<UpdatePatient> {
  final _formkey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  Patient? newdata;
  String village="";

  final tt1Controller = TextEditingController();
  final tt2Controller = TextEditingController();
  final ttbController = TextEditingController();
  final consdietController = TextEditingController();

  bool tt1switch = false;
  bool tt2switch = false;
  bool ttbswitch = false;
  bool counsDiet = false;

  var patient = {};

  bool loading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      newdata = widget.p;
      village=widget.villagename;
      tt1switch=newdata!.tt1switch==null?false:true;
      tt2switch=newdata!.tt2switch==null?false:true;
      ttbswitch=newdata!.ttbswitch==null?false:true;
      counsDiet=newdata!.counsDiet==null?false:true;
     
    });

  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? Center(
            child: CircularProgressIndicator(
              color: Colors.blue,
            ),
          )
        : Scaffold(
            appBar: AppBar(title: Text("Update Patient")),
            body: SingleChildScrollView(
              child: Form(
                key: _formkey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    child: Column(
                      children: [
                        Text(newdata!.name!,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                        Text(village,style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                        SizedBox(
                          height: 10,
                        ),
                        /////    additional information switches
                        ListTile(
                          title: Text("TT1 "),
                          subtitle: Text(
                            newdata!.tt1switch ?? tt1Controller.text,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue),
                          ),
                          trailing: Switch(
                            value: tt1switch,
                            onChanged: newdata!.tt1switch!=null?null:((value) async {
                              if (value) {
                                final tt1date = await openSwitchDialog(
                                    "TT1", tt1Controller);
                                if (tt1date == "") {
                                  return;
                                }
                              } else {
                                tt1Controller.clear();
                              }
                              setState(() {
                                tt1switch = value;
                                patient["tt1switch"] = tt1Controller.text;
                              });
                            }),
                          ),
                        ),
                        ListTile(
                          title: Text("TT2"),
                          subtitle: Text(
                            newdata!.tt2switch ?? tt2Controller.text,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue),
                          ),
                          trailing: Switch(
                            value: tt2switch,
                            onChanged:newdata!.tt2switch!=null?null: ((value) async {
                              if (value) {
                                final tt2date = await openSwitchDialog(
                                    "TT2", tt2Controller);
                                if (tt2date == "") {
                                  return;
                                }
                              } else {
                                tt2Controller.clear();
                              }
                              setState(() {
                                tt2switch = value;
                                patient["tt2switch"] = tt2Controller.text;
                              });
                            }),
                          ),
                        ),
                        ListTile(
                          title: Text("TTB"),
                          subtitle: Text(
                            newdata!.ttbswitch ?? ttbController.text,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue),
                          ),
                          trailing: Switch(
                            value: ttbswitch,
                            onChanged: newdata!.ttbswitch!=null?null:((value) async {
                              if (value) {
                                final ttbdate = await openSwitchDialog(
                                    "TTB", ttbController);
                                if (ttbdate == "") {
                                  return;
                                }
                              } else {
                                ttbController.clear();
                              }
                              setState(() {
                                ttbswitch = value;
                                patient["ttbswitch"] = ttbController.text;
                              });
                            }),
                          ),
                        ),
                        ListTile(
                          title: Text("Counselling about Diet"),
                          subtitle: Text(
                            consdietController.text,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue),
                          ),
                          trailing: Switch(
                            value: counsDiet,
                            onChanged: newdata!.counsDiet!=null?null:((value) async {
                              setState(() {
                                counsDiet = value;
                                consdietController.text = value ? "Yes" : "No";
                                patient["counsDiet"] = counsDiet ? "1" : "0";
                              });
                            }),
                          ),
                        ),
                        Center(child: patient.isNotEmpty?Button(context, "Submit", checkdata):SizedBox(width: 0,)),
                        SizedBox(
                          height: 10,
                        ),

                        
                      ],
                    ),
                  ),
                ),
              ),
            ));
  }

  Future<String?> openSwitchDialog(id, controller) => showDialog<String?>(
      context: context,
      builder: (context) => AlertDialog(
            title: Text(id),
            content: TextField(
              readOnly: true,
              onTap: () async {
                DateTime? sdate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2021),
                  lastDate: DateTime.now(),
                );
                if (sdate != null) {
                  controller.text =
                      "${sdate.day < 10 ? "0${sdate.day}" : sdate.day}-${sdate.month < 10 ? "0${sdate.month}" : sdate.month}-${sdate.year}";
                }
              },
              autofocus: true,
              controller: controller,
              keyboardType: TextInputType.datetime,
              decoration: getinputstyle(hint: "Enter Date"),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(controller.text);
                  },
                  child: Text("Ok"))
            ],
          ));

  getinputstyle({required String hint}) {
    return InputDecoration(
        hintText: hint,
        counterText: "",
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.purple, width: 2),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.blue),
        ));
  }

  Future<void> checkdata() async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        loading = true;
      });

      patient["access_token"] = FirebaseAuth.instance.currentUser!.uid;
      patient["id"]=newdata!.id.toString();
      

       String? s = await postUpdatePatient(jsonEncode(patient));
      setState(() {
        loading = false;
      });
      if (s != null) {
        
        makeSuccesstoast(msg: s ?? "Null", ctx: context);
        Navigator.of(context).pop();
      }
    }
  }

  Future<String?> postUpdatePatient(String d) async {
    Map<String, dynamic> json;
    try {
      var url = Uri.https('vcare.aims.96.lt', '/api/ashaupdatepatient');
      Map<String, dynamic> data = jsonDecode(d);
      print(data);
      var response = await http.post(url, body: data);

      if (response.statusCode == 200) {
        json = jsonDecode(response.body);
        if (json["code"] != "") {
          return json["msg"];
        }
        return null;
      } else {
        return "Server Down";
      }
    } catch (e) {
      return "Something Went Wrong $e";
    }
  }
}
