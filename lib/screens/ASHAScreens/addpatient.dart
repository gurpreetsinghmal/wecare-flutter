import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:Sujatha/reusables.dart';
import 'package:http/http.dart' as http;

class AddNewPatient extends StatefulWidget {
  final String dist, block;
  const AddNewPatient(this.dist, this.block, {super.key});

  @override
  State<AddNewPatient> createState() => _AddNewPatientState();
}

class _AddNewPatientState extends State<AddNewPatient> {
  final _formkey = GlobalKey<FormState>();
  final _formkey2 = GlobalKey<FormState>();

  //controllers
  final nameController = TextEditingController();
  final husbandnameController = TextEditingController();
  final mobileController = TextEditingController();


  final devliverycountController = TextEditingController();
  final prevageController = TextEditingController();
  final deliveryTypeController = TextEditingController();

  TextEditingController _JSYBeneficiary = TextEditingController();
  final tt1Controller = TextEditingController();
  final tt2Controller = TextEditingController();
  final ttbController = TextEditingController();
  final consdietController = TextEditingController();
  final ayushmanController = TextEditingController();
  final abhaIdController = TextEditingController();
  //final bloodgroupController = TextEditingController();
  //final jsyController = TextEditingController();


  //variables

  List villagedata = [];
  var villagevalue;
  var prevchild = "0";
  var sex = "M";
  var prevdeliverytype ;
  var jsyValue ;
  var selectedBloodGroup; // Variable to hold the selected blood group

  List<String> bloodGroups = [
    'A+',
    'B+',
    'AB+',
    'O+',
    'A-',
    'B-',
    'AB-',
    'O-',
  ];

  bool tt1switch = false;
  bool tt2switch = false;
  bool ttbswitch = false;
  bool counsDiet = false;
  bool ayushmanCardswitch = false;
  bool jsyswitch = false;
  //String preChildChoice = '0';

  // Default value is 'No'

  final _choice = [
    {"text": 'No', "val": '0'},
    {"text": 'Yes', "val": '1'}
  ];
  final _jsy = [
    {"text": 'Yes', "val": '1'},
    {"text": 'No', "val": '0'}
  ];
  final deliverychoices = [
    {"text": "Normal", "val": "0"},
    {"text": "Cesarean", "val": "1"},
  ];

  var patient = {};

  Future<void> getvillagelist() async {
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
          Map<String, dynamic>? village = jsonResponse["villages"];
          villagedata=[];
          village!.forEach((key, value) {
            var data = {"key": key, "value": value.toString()};
            villagedata.add(data);
          });
          setState(() {});
        }
      } else {}
    } catch (e) {
      maketoast(msg: "api error:${e.toString()}", ctx: context);
    }
  }

  @override
  void initState() {
    super.initState();
    getvillagelist();
  }

  bool loading = false;

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

  @override
  Widget build(BuildContext context) {
    Future<void> checkdata() async {
      if (_formkey.currentState!.validate()) {
        setState(() {
          loading = true;
        });
        patient["name"] = nameController.text.trim();
        patient["husbandName"] = husbandnameController.text.trim();
        patient["village"] = villagevalue;
        patient["mobile"] = mobileController.text.trim();
        //patient["abhaId"] = abhaIdController.text.trim();

        patient["abhaId"] = abhaIdController.text.trim();
        patient["bloodgroup"] = selectedBloodGroup;
        patient["jSYBeneficiary"] = jsyValue;

        patient["access_token"] = FirebaseAuth.instance.currentUser!.uid;

        print("data validated");
        print(jsonEncode(patient));

        String? s = await postAddPatient(jsonEncode(patient));
        setState(() {
          loading = false;
        });
        if (s != null) {
          print(s);
          makeSuccesstoast(msg: s, ctx: context);
          Navigator.of(context).pop();
        }
      }
    }

    return loading
        ? Center(
            child: CircularProgressIndicator(
              color: Colors.blue,
            ),
          )
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blue,
              title: const Text('Add Patient'),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                    child: Container(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              backgroundColor: Colors.blue,
                              child: Icon(
                                Icons.pregnant_woman,
                                color: Colors.white,
                                size: 30,
                              ),
                              radius: 30,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Pregnant Woman Details',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    child: Form(
                        key: _formkey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Name"),
                            TextFormField(
                              controller: nameController,
                              decoration:
                                  getinputstyle(hint: "Enter Patient Name"),
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'[a-zA-Z ]+')),
                              ],
                              validator: (v) {
                                if (v == null || v.isEmpty) {
                                  return "Please enter name";
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Husband Name"),
                            TextFormField(
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'[a-zA-Z ]+')),
                              ],
                              controller: husbandnameController,
                              decoration:
                                  getinputstyle(hint: "Enter Husband Name"),
                              validator: (v) {
                                if (v == null || v.isEmpty) {
                                  return "Please enter Husband name";
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Village Name"),
                            DropdownButtonFormField(
                              decoration: getinputstyle(hint: "Choose village"),
                              hint: Text("Choose Patient Village"),
                              items: villagedata.map((item) {
                                return DropdownMenuItem(
                                  value: item["key"],
                                  child: Text(item["value"].toString()),
                                );
                              }).toList(),
                              onChanged: (newVal) {
                                setState(() {
                                  villagevalue = newVal.toString();
                                });
                              },
                              value: villagevalue,
                              validator: (v) {
                                if (v == null) {
                                  return "Please choose village";
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Mobile Number"),
                            TextFormField(
                              maxLength: 10,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'[0-9]')),
                              ],
                              controller: mobileController,
                              decoration: getinputstyle(
                                  hint: "Enter Patient Mobile No"),
                              validator: (v) {
                                if (v == null || v.isEmpty || v.length < 10) {
                                  return "Enter valid Patient Mobile No";
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Abha Id"),
                            TextFormField(
                              maxLength: 14,
                              controller: abhaIdController,
                              decoration:
                              getinputstyle(hint: "Enter Patient Abha Id"),
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'[a-zA-Z0-9]+')),
                              ],
                              validator: (v) {
                                if (v == null || v.isEmpty) {
                                  return "Please enter the Patient Abha Id";
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            /*Text("Blood Group"),
                            TextFormField(
                              controller: bloodgroupController,
                              decoration:
                              getinputstyle(hint: "Enter Patient Blood Group"),
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'[a-zA-Z0-9 ]+')),
                              ],
                              validator: (v) {
                                if (v == null || v.isEmpty) {
                                  return "Please enter the Patient Abha Id";
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),*/
                            Text("Blood Group"),
                            DropdownButtonFormField(
                              value: selectedBloodGroup,
                              onChanged: (newValue) {
                                setState(() {
                                  selectedBloodGroup = newValue.toString();
                                });
                              },
                              decoration: getinputstyle(hint: "Choose Blood group of patient"),
                              items: bloodGroups.map((String bloodGroup) {
                                return DropdownMenuItem<String>(
                                  value: bloodGroup,
                                  child: Text(bloodGroup),
                                );
                              }).toList(),

                              validator: (v) {
                                if (v == null) {
                                  return "Please choose Blood group";
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                           /* Text(
                                "Patient JSY beneficiary"),
                            DropdownButtonFormField(
                                      decoration: getinputstyle(hint: "Choose Yes or No"),
                                      hint: Text("Choose Yes or No"),
                                      items: [
                                        DropdownMenuItem(
                                          value: 0,
                                          child: Text('No'),
                                        ),
                                        DropdownMenuItem(
                                          value: 1,
                                          child: Text('Yes'),
                                        ),
                                      ],
                                      onChanged: (newVal) {
                                        setState(() {
                                          jsyValue = newVal as int?;
                                        });
                                      },
                                      value: jsyValue,
                                      validator: (v) {
                                        if (v == null) {
                                          return "Please choose an option";
                                        }
                                        return null;
                                      },
                                    )
                            SizedBox(
                              height: 10,
                            ),*/
                            Text("JSY Beneficiary"),
                            DropdownButtonFormField(
                              decoration: getinputstyle(
                                  hint: "Choose Yes or No"),

                              items: _jsy
                                  .map((item) {
                                return DropdownMenuItem(
                                  value: item['val']
                                      .toString(),
                                  child: Text(item[
                                  "text"]
                                      .toString()),
                                );
                              }).toList(),
                              value:
                              jsyValue,
                              validator: (v) {
                                if (v == null) {
                                  return "Please choose Yes or No";
                                }
                                jsyValue =
                                    v;
                                return null;
                              },
                              onChanged: (v) {},
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                                "Want to fill information about previous delivery"),
                            DropdownButtonFormField(
                              decoration:
                                  getinputstyle(hint: "Previous Delivery"),
                              hint: Text("Select"),
                              items: _choice.map((item) {
                                return DropdownMenuItem(
                                  value: item['val'].toString(),
                                  child: Text(item["text"].toString()),
                                );
                              }).toList(),
                              onChanged: (newVal) {
                                setState(() {
                                  prevchild = newVal.toString();
                                  if (prevchild == "1") {
                                    print(patient);
                                    showDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (BuildContext context) {
                                          return Form(
                                            key: _formkey2,
                                            child: StatefulBuilder(builder:
                                                (context,
                                                    StateSetter setState) {
                                              return AlertDialog(
                                                title: Text(
                                                    "Information about Previous Delivery"),
                                                content: SingleChildScrollView(
                                                  child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                            "Current Delivery Count"),
                                                        TextFormField(
                                                          controller:
                                                              devliverycountController,
                                                          maxLength: 1,
                                                          inputFormatters: <TextInputFormatter>[
                                                            FilteringTextInputFormatter
                                                                .allow(RegExp(
                                                                    r'[0-9]')),
                                                          ],
                                                          decoration: getinputstyle(
                                                              hint:
                                                                  "Enter Delivery Count"),
                                                          validator: (v) {
                                                            if (v == null ||
                                                                v.isEmpty) {
                                                              return "Enter valid Delivery Count";
                                                            } else if (v ==
                                                                    "0" ||
                                                                v == "1") {
                                                              return "Current Delivery count must be greater than 1";
                                                            }

                                                            return null;
                                                          },
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Text(
                                                            "Age of Previous Child"),
                                                        TextFormField(
                                                          controller:
                                                              prevageController,
                                                          maxLength: 2,
                                                          inputFormatters: <TextInputFormatter>[
                                                            FilteringTextInputFormatter
                                                                .allow(RegExp(
                                                                    r'[0-9]')),
                                                          ],
                                                          decoration: getinputstyle(
                                                              hint:
                                                                  "Enter Age of Previous Child"),
                                                          validator: (v) {
                                                            if (v == null ||
                                                                v.isEmpty) {
                                                              return "Enter Age of Previous Child";
                                                            }
                                                            if (int.parse(
                                                                    prevageController
                                                                        .text) <
                                                                1) {
                                                              return "Enter valid age";
                                                            }

                                                            return null;
                                                          },
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Text(
                                                            "Previous Delivery Type"),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        DropdownButtonFormField(
                                                          decoration: getinputstyle(
                                                              hint:
                                                                  "Previous Delivery Type"),
                                                          hint: Text("Select"),
                                                          items: deliverychoices
                                                              .map((item) {
                                                            return DropdownMenuItem(
                                                              value: item['val']
                                                                  .toString(),
                                                              child: Text(item[
                                                                      "text"]
                                                                  .toString()),
                                                            );
                                                          }).toList(),
                                                          value:
                                                              prevdeliverytype,
                                                          validator: (v) {
                                                            if (v == null) {
                                                              return "Please choose previous delivery type";
                                                            }
                                                            prevdeliverytype =
                                                                v;
                                                            return null;
                                                          },
                                                          onChanged: (v) {},
                                                        ),
                                                        SizedBox(height: 10),
                                                        Text(
                                                            "Gender of Previous Child"),
                                                        Row(
                                                          children: [
                                                            Expanded(
                                                              child:
                                                                  RadioListTile(
                                                                      contentPadding: EdgeInsets.symmetric(
                                                                          horizontal:
                                                                              0.0),
                                                                      title: Text(
                                                                          "Male"),
                                                                      value:
                                                                          "M",
                                                                      groupValue:
                                                                          patient["sexPreviousChild"] ??
                                                                              sex,
                                                                      onChanged:
                                                                          (v) {
                                                                        setState(
                                                                            () {
                                                                          sex =
                                                                              v.toString();
                                                                        });
                                                                      }),
                                                            ),
                                                            Expanded(
                                                              child:
                                                                  RadioListTile(
                                                                      contentPadding: EdgeInsets.symmetric(
                                                                          horizontal:
                                                                          0.0),
                                                                      title: Text(
                                                                          "Female"),
                                                                      value:
                                                                          "F",
                                                                      groupValue:
                                                                          patient["sexPreviousChild"] ??
                                                                              sex,
                                                                      onChanged:
                                                                          (v) {
                                                                        setState(
                                                                            () {
                                                                          sex =
                                                                              v.toString();
                                                                        });
                                                                      }),
                                                            )
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                      ]),
                                                ),
                                                actions: [
                                                  Button(context, "Cancle", () {

                                                      prevchild = "0"; // Set prevchild to 'No'
                                                      Navigator.of(context).pop(false);

                                                  }),
                                                  Button(context, "Ok", () {
                                                    if (_formkey2.currentState!
                                                        .validate()) {
                                                      patient["currDeliveryCount"] =
                                                          devliverycountController
                                                              .text;
                                                      patient["prevChildAge"] =
                                                          prevageController
                                                              .text;
                                                      patient["previousDeliveryType"] =
                                                          prevdeliverytype;
                                                      patient["sexPreviousChild"] =
                                                          sex;

                                                      Navigator.pop(context);
                                                    }
                                                  }),
                                                ],
                                              );
                                            }),
                                          );
                                        });
                                  } else {}
                                });
                              },
                              value: prevchild,
                              validator: (v) {
                                if (v == null) {
                                  return "Please choose option";
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Additional Information",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            SizedBox(
                              height: 10,
                            ),



                            /////    additional information switches



   /*                 Row(
                    children: [
                        Text('Ayushman card: '),
                    DropdownButton<String>(
                      value: dropdownValue,
                      onChanged: (String? newValue) async {
                        setState(() {
                          dropdownValue = newValue!;
                        });

                        if (newValue == 'Yes') {
                          final userInput = await openTextDialog("Ayushman Card details",ayushmanController);
                          if (userInput != null) {
                            setState(() {
                              ayushmanController.text = userInput;
                            });
                          }
                        }
                      },
                      items: <String>['Yes', 'No'].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    ],
                  ), //if waant to use dropdown instead of toggle
                            Text(
                              "JSY Beneficiary",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                            Text("JSY Beneficiary"),
                            TextInputJSYBeneficiary(),*/
                            ListTile(
                              title: Text("Ayushman card holder"),
                              subtitle: Text(
                                ayushmanController.text,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue),
                              ),
                              trailing: Switch(
                                value: ayushmanCardswitch,
                                onChanged: ((value) async {
                                  if (value) {
                                    final ayushmanCardDetails = await openTextDialog("Ayushman Card details", ayushmanController);
                                        if (ayushmanCardDetails == null || ayushmanCardDetails.isEmpty) {
                                          return;
                                        }
                                  } else {
                                    ayushmanController.clear();
                                  }
                                  setState(() {
                                    ayushmanCardswitch = value;
                                    patient["ayushmanId"] = ayushmanController.text;
                                  });
                                }),
                              ),
                            ),

                            ListTile(
                              title: Text("TT1 "),
                              subtitle: Text(
                                tt1Controller.text,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue),
                              ),
                              trailing: Switch(
                                value: tt1switch,
                                onChanged: ((value) async {
                                  if (value) {
                                    final tt1date = await openSwitchDialog(
                                        "TT1", tt1Controller);
                                    if (tt1date == null || tt1date.isEmpty) {
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
                                tt2Controller.text,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue),
                              ),
                              trailing: Switch(
                                value: tt2switch,
                                onChanged: ((value) async {
                                  if (value) {
                                    final tt2date = await openSwitchDialog(
                                        "TT2", tt2Controller);
                                    if (tt2date == null || tt2date.isEmpty) {
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
                                ttbController.text,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue),
                              ),
                              trailing: Switch(
                                value: ttbswitch,
                                onChanged: ((value) async {
                                  if (value) {
                                    final ttbdate = await openSwitchDialog(
                                        "TTB", ttbController);
                                    if (ttbdate == null || ttbdate.isEmpty) {
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
                                onChanged: ((value) async {
                                  setState(() {
                                    counsDiet = value;
                                    consdietController.text =
                                        value ? "Yes" : "No";
                                    patient["counsDiet"] =
                                        counsDiet ? "1" : "0";
                                  });
                                }),
                              ),
                            ),
                            Center(
                              child: TextButton(
                                child: Text("Submit"),
                                onPressed: checkdata,
                              ),
                            ),
                            // Center(child: Button(context, "Submit", checkdata)),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        )),
                  )
                ],
              ),
            ),
          );
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
  Future<String?> openTextDialog(String text, TextEditingController controller) async {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(text),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(labelText: "Enter details"),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(null);
              },
            ),
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop(controller.text);
              },
            ),
          ],
        );
      },
    );
  }
  Widget TextInputJSYBeneficiary(){

    return Row(
      children: [
        Expanded(
          child:
          RadioListTile(
              contentPadding: EdgeInsets.symmetric(
                  horizontal:
                  0.0),
              title: Text(
                  "Yes"),
              value:
              "1",
              groupValue:
              _JSYBeneficiary.text,
              onChanged:
                  (v) {
                setState(
                        () {
                      _JSYBeneficiary.text=v.toString();
                    });
              }),
        ),
        Expanded(
          child:
          RadioListTile(
              contentPadding: EdgeInsets.symmetric(
                  horizontal:
                  0.0),
              title: Text(
                  "No"),
              value:
              "0",
              groupValue:
              _JSYBeneficiary.text,
              onChanged:
                  (v) {
                setState(
                        () {
                      _JSYBeneficiary.text=v.toString();
                    });
              }),
        )
      ],
    );
  }
  Future<String?> postAddPatient(String d) async {
    Map<String, dynamic> json;
    try {
      var url = Uri.https('vcare.aims.96.lt', '/api/addpatient');
      Map<String, dynamic> data = jsonDecode(d);

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
