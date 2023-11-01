import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:Sujatha/models/patient.dart';
import 'package:Sujatha/reusables.dart';


class UpdatePersonal extends StatefulWidget {
  final Patient p;
  final villagename;
  final ashaname;
  const UpdatePersonal( this.p,this.villagename,this.ashaname,{Key? key}) : super(key: key);

  @override
  State<UpdatePersonal> createState() => _UpdatePersonalState();
}

class _UpdatePersonalState extends State<UpdatePersonal> {
  final _formKey = GlobalKey<FormState>();
  final _formkey2 = GlobalKey<FormState>();

  TextEditingController _currentDeliveryCount=TextEditingController();
  TextEditingController _prevChildAge=TextEditingController();
  TextEditingController _previousDeliveryType=TextEditingController();
  TextEditingController _sexPreviousChild=TextEditingController();
  TextEditingController _TT1=TextEditingController();
  TextEditingController _TT2=TextEditingController();
  TextEditingController _TTB=TextEditingController();
  TextEditingController _CounsDiet=TextEditingController();

  //================================================
  TextEditingController _RCHID=TextEditingController();
  TextEditingController _DOB=TextEditingController();
  TextEditingController _Caseno=TextEditingController();
  TextEditingController _MotherName=TextEditingController();
  TextEditingController _HusbandName=TextEditingController();
  TextEditingController _MobileNo=TextEditingController();
  TextEditingController _MotherAgeAtMarriage=TextEditingController();
  TextEditingController _MotherCurentAge=TextEditingController();
  TextEditingController _ANMName=TextEditingController();
  TextEditingController _ASHAName=TextEditingController();
  TextEditingController _GynacologistName=TextEditingController();
  TextEditingController _BankName=TextEditingController();
  TextEditingController _AccountNumber=TextEditingController();
  TextEditingController _IFSCNo=TextEditingController();
  TextEditingController _AadharNo=TextEditingController();
  TextEditingController _Caste=TextEditingController();
  TextEditingController _EconomicStatus=TextEditingController();
  TextEditingController _Address=TextEditingController();
  TextEditingController _RegistrationDateController = TextEditingController();
  TextEditingController _ParaGravida=TextEditingController();
  TextEditingController _LMP=TextEditingController();
  TextEditingController _EDD=TextEditingController();
  TextEditingController _Weight=TextEditingController();
  TextEditingController _Heightf=TextEditingController();
  TextEditingController _Heighti=TextEditingController();
  TextEditingController _PastIllness=TextEditingController();

  bool tt1switch = false;
  bool tt2switch = false;
  bool ttbswitch = false;
  bool counsDiet = false;
  var prevdeliverytype;
  var sex = "M";

  final _choice = [
    {"text": 'No', "val": '0'},
    {"text": 'Yes', "val": '1'}
  ];

  final deliverychoices = [
    {"text": "Normal", "val": "0"},
    {"text": "Cesarean", "val": "1"},
  ];

  final castes=[
    {"text": "General", "val": "0"},
    {"text": "SC", "val": "1"},
    {"text": "ST", "val": "2"},
    {"text": "OBC", "val": "3"},
  ];
  final economystatus=[
    {"text": "Normal", "val": "0"},
    {"text": "EWS", "val": "1"},
  ];

  final para=[
    {"text": "Para", "val": "PARA"},
    {"text": "Gravida", "val": "GRAVIDA"},
  ];

  Patient? newdata;
  String village="";
  String ashaname="";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      newdata = widget.p;
      village=widget.villagename;
      ashaname=widget.ashaname;

      tt1switch=newdata!.tt1switch==null?false:true;
      tt2switch=newdata!.tt2switch==null?false:true;
      ttbswitch=newdata!.ttbswitch==null?false:true;

      _TT1.text=newdata!.tt1switch??"";
      _TT2.text=newdata!.tt2switch??"";
      _TTB.text=newdata!.ttbswitch??"";
      _CounsDiet.text=newdata!.counsDiet??"0";

      _currentDeliveryCount.text=newdata!.currDeliveryCount??"";
      _prevChildAge.text=newdata!.prevChildAge??"";
      _previousDeliveryType.text=newdata!.previousDeliveryType??"0";
      _sexPreviousChild.text=newdata!.sexPreviousChild??"M";
      _RCHID.text=newdata!.rchid??"";
      _Caseno.text=newdata!.caseno??"";
      _DOB.text=newdata!.dob??"";
      // _Caseno.text=newdata!.case;
      _MotherName.text=newdata!.mothername??"";
      // _HusbandName.text=newdata!.;
      _MobileNo.text=newdata!.mobile??"";
      _MotherAgeAtMarriage.text=newdata!.ageatmarriage??"";
      // _ANMName.text=newdata!.;
      _MotherCurentAge.text=newdata!.dob??"";
      // _ASHAName.text=newdata!.;
      // _GynacologistName.text=newdata!.;
      _BankName.text=newdata!.bankname??"";
      _AccountNumber.text=newdata!.accountno??"";
      _IFSCNo.text=newdata!.ifsccode??"";
      // _AadharNo.text=newdata!.a;
      _Caste.text=newdata!.caste??castes[0]["val"].toString();
      _EconomicStatus.text=newdata!.economy??economystatus[0]["val"].toString();
      _Address.text=newdata!.address??"";
      _RegistrationDateController.text =newdata!.regdate??"";
      _ParaGravida.text=newdata!.para??para[0]["val"].toString();
      _LMP.text=newdata!.lmp??"";
      _EDD.text=newdata!.edd??"";
      _Weight.text=newdata!.weight??"";
      _Heightf.text=newdata!.heightf??"";
      _Heighti.text=newdata!.heighti??"";
      _PastIllness.text=newdata!.pastillness??"";
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        iconTheme: IconThemeData(
          color: Colors.white
        ),
        title: Text("Update Personal Details",style: TextStyle(fontSize: 18,color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(subtitle:Text("Name"),title:Text(newdata!.name.toString(),) ,),
                ListTile(subtitle:Text("Husband Name"),title:Text(newdata!.husbandName.toString(),),),
                ListTile(subtitle:Text("Village Name"),title:Text(village.toString(),),),
                ListTile(subtitle:Text("Asha Name"),title:Text(ashaname.toString(),),),

                /////    additional information switches
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
                      if (newVal.toString() == "1") {
                        showDialog(
                            context: context,
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
                                              _currentDeliveryCount,
                                              maxLength: 1,
                                              keyboardType: TextInputType.number,
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
                                              _prevChildAge,
                                              maxLength: 2,
                                              keyboardType: TextInputType.number,
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
                                                    _prevChildAge.text) < 1) {
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
                                              _previousDeliveryType.text,
                                              validator: (v) {
                                                if (v == null) {
                                                  return "Please choose previous delivery type";
                                                }
                                                _previousDeliveryType.text =v.toString();
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
                                                      _sexPreviousChild.text,
                                                      onChanged:
                                                          (v) {
                                                        setState(
                                                                () {
                                                                  _sexPreviousChild.text=v.toString();
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
                                                      _sexPreviousChild.text,
                                                      onChanged:
                                                          (v) {
                                                        setState(
                                                                () {
                                                              sex =
                                                              _sexPreviousChild.text=v.toString();
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
                                      Button(context, "Ok", () {
                                        if (_formkey2.currentState!
                                            .validate()) {
                                            print([
                                              _currentDeliveryCount.text,
                                              _previousDeliveryType.text,
                                              _prevChildAge.text,
                                              _sexPreviousChild.text
                                            ]);
                                           Navigator.pop(context);
                                        }
                                      })
                                    ],
                                  );
                                }),
                              );
                            });
                      } else {}
                    });
                  },
                  value: _prevChildAge.text==""?"0":"1",
                  validator: (v) {
                    if (v == null) {
                      return "Please choose option";
                    }
                    return null;
                  },
                ),

                SizedBox(height: 20,),

                TextInputRCHID(),
                  SizedBox(height: 20,),
                  TextInputCaseNo(),
                  SizedBox(height: 20,),
                 TextInputDOB(),
                SizedBox(height: 20,),

                  // TextInputMotherName(),
                  // SizedBox(height: 20,),
                //   TextInputHusbandName(),
                //   SizedBox(height: 20,),
                //   TextInputMobileNo(),
                //   SizedBox(height: 20,),
                  TextInputMotherAgeAtMarriage(),
                  SizedBox(height: 20,),
                //   TextInputcurrentAge(),
                //   SizedBox(height: 20,),
                // TextInputANMName(),
                //   SizedBox(height: 20,),
                // TextInputAshaName(),
                //   SizedBox(height: 20,),
                // TextInputGynaecologistName(),
                //   SizedBox(height: 20,),
                TextInputBankName(),
                  SizedBox(height: 20,),
                TextInputAccountNumber(),
                  SizedBox(height: 20,),
                TextInputIFSCCode(),
                  SizedBox(height: 20,),
                // TextInputAadharCardNo(),
                // SizedBox(height: 20,),
                Text("Mother Caste Category"),
                TextInputCaste(),
                SizedBox(height: 20,),
                Text("Economic Status"),
                TextInputEconomicStatus(),
                SizedBox(height: 20,),
                TextInputAddress(),
                SizedBox(height: 20,),
                TextInputRegistrationDate(),
                SizedBox(height: 20,),
                Text("PARA/GRAVIDA"),
                TextInputGravida(),
                SizedBox(height: 20,),
                TextInputLMP(),
                SizedBox(height: 20,),
                TextInputEDD(),
                SizedBox(height: 20,),
                TextInputWeight(),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Expanded(child: TextInputHeightf()),
                    SizedBox(width: 20,),
                    Expanded(child:TextInputHeighti()),
                  ],
                ),
                SizedBox(height: 20,),
                TextInputPastIllness(),
                SizedBox(height: 20,),

                ListTile(
                  title: Text("TT1"),
                  subtitle: Text(
                    newdata!.tt1switch ?? _TT1.text,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                  trailing: Switch(
                    value: tt1switch,
                    onChanged:
                    ((value) async {
                      if (value) {
                        final tt1date = await openSwitchDialog(
                            "TT1", _TT1);
                        if (tt1date == "") {
                          return;
                        }
                      } else {
                        _TT1.clear();
                      }
                      setState(() {
                        tt1switch = value;
                        newdata!.tt1switch = _TT1.text;
                      });
                    }),
                  ),
                ),
                ListTile(
                  title: Text("TT2 "),
                  subtitle: Text(
                    newdata!.tt2switch ?? _TT2.text,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                  trailing: Switch(
                    value: tt2switch,
                    onChanged:((value) async {
                      if (value) {
                        final tt2date = await openSwitchDialog(
                            "TT2", _TT2);
                        if (tt2date == "") {
                          return;
                        }
                      } else {
                        _TT2.clear();
                      }
                      setState(() {
                        tt2switch = value;
                        newdata!.tt2switch = _TT2.text;
                      });
                    }),
                  ),
                ),
                ListTile(
                  title: Text("TTB"),
                  subtitle: Text(
                    newdata!.ttbswitch ?? _TTB.text,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                  trailing: Switch(
                    value: ttbswitch,
                    onChanged: ((value) async {
                      if (value) {
                        final ttbdate = await openSwitchDialog(
                            "TTB", _TTB);
                        if (ttbdate == "") {
                          return;
                        }
                      } else {
                        _TTB.clear();
                      }
                      setState(() {
                        ttbswitch = value;
                        newdata!.ttbswitch= _TTB.text;
                      });
                    }),
                  ),
                ),
                ListTile(
                  title: Text("Counselling about Diet"),
                  subtitle: Text(
                    _CounsDiet.text=="1"?"Yes":"No",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                  trailing: Switch(
                    value: _CounsDiet.text=="1",
                    onChanged: ((value) async {
                      setState(() {
                        _CounsDiet.text = (value? "1" : "0");
                      });
                    }),
                  ),
                ),

                //submit personal details
                Row(
                  children: [
                    Expanded(flex: 1,
                      child: ElevatedButton(
                          child: Text("Submit",style: TextStyle(color: Colors.white),),
                          onPressed: () async {
                            // if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();

                            var personaldata= {
                              "id": newdata!.id,
                              "access_token": FirebaseAuth.instance
                                  .currentUser!.uid,
                              "rchid": _RCHID.text,
                              "caseno": _Caseno.text,
                              "currDeliveryCount": _currentDeliveryCount.text,
                              "prevChildAge": _currentDeliveryCount.text=="1"?null:_prevChildAge.text,
                              "previousDeliveryType":_currentDeliveryCount.text=="1"?null: _previousDeliveryType
                                  .text,
                              "sexPreviousChild": _currentDeliveryCount.text=="1"?null:_sexPreviousChild.text,
                              // "mothername": _MotherName.text,
                              "ageatmarriage": _MotherAgeAtMarriage.text,
                              "regdate": _RegistrationDateController.text,
                              "dob": _DOB.text,
                              "bankname": _BankName.text,
                              "accountno": _AccountNumber.text,
                              "ifsccode": _IFSCNo.text,
                              "caste": _Caste.text,
                              "economy": _EconomicStatus.text,
                              "address": _Address.text,
                              "para": _ParaGravida.text,
                              "Lmp": _LMP.text,
                              "edd": _EDD.text,
                              "weight": _Weight.text,
                              "heightf": _Heightf.text,
                              "heighti": _Heighti.text,
                              "pastillness": _PastIllness.text,
                              "tt1switch": _TT1.text,
                              "tt2switch": _TT2.text,
                              "ttbswitch": _TTB.text,
                              "counsDiet":_CounsDiet.text,
                              "section":"personal"
                            };

                            final response = await http.post(
                              Uri.parse('https://vcare.aims.96.lt/api/anmupdatepatient'),
                              headers: <String, String>{
                                'Content-Type': 'application/json; charset=UTF-8',
                              },
                              body: jsonEncode(personaldata),
                            );

                            var res=jsonDecode(response.body);
                            print(res);
                            if(res["code"]==200){
                              makeSuccesstoast(msg:res["msg"] , ctx: context);
                              Navigator.pop(context);
                            }
                            else
                            {
                              maketoast(msg:res["msg"] , ctx: context);
                            }

                            Navigator.pop(context);

                          }
                          // }
                          ,
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.blue,

                          )
                      ),)
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget TextInputcurrDeliveryCount(){

    return TextFormField(
      keyboardType: TextInputType.number,
      onSaved: (newValue) => _currentDeliveryCount.text = newValue!,
      controller: _currentDeliveryCount,

      // initialValue: newdata!.currDeliveryCount.toString(),
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter
            .allow(RegExp(
            r'[0-9]')),
      ],
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'Enter Current Delivery Count',
        floatingLabelStyle: MaterialStateTextStyle.resolveWith(
              (Set<MaterialState> states) {
            final Color color = states.contains(MaterialState.error)
                ? Theme.of(context).colorScheme.error
                : Colors.blue;
            return TextStyle(color: color, letterSpacing: 1.3);
          },
        ),
      ),
      validator: (String? value) {
        if (value == null ||  value =='0') {
          return 'Current Delivery count must be greater than 0';
        }
        else if(value.toString()=="1"){

            _prevChildAge.text="";
            _previousDeliveryType.text="0";
            _sexPreviousChild.text="M";
            _currentDeliveryCount.text=value.toString();
          }

        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
  Widget TextInputprevChildAge(){

    return TextFormField(
      keyboardType: TextInputType.number,
      onSaved: (newValue) => _prevChildAge.text = newValue!,
      controller: _prevChildAge,
      enabled: _currentDeliveryCount.text=='1'?false:true,
      // initialValue: newdata!.currDeliveryCount.toString(),
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'Enter Age of Previous Child',
        floatingLabelStyle: MaterialStateTextStyle.resolveWith(
              (Set<MaterialState> states) {
            final Color color = states.contains(MaterialState.error)
                ? Theme.of(context).colorScheme.error
                : Colors.blue;
            return TextStyle(color: color, letterSpacing: 1.3);
          },
        ),
      ),inputFormatters: <TextInputFormatter>[
      FilteringTextInputFormatter
          .allow(RegExp(
          r'[0-9]')),
    ],
      validator: (v) {
        if (v == null ||
            v.isEmpty) {
          return "Enter Age of Previous Child";
        }
        if (int.parse(
            _prevChildAge
                .text) <
            1) {
          return "Enter valid age";
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
  Widget TextInputpreviousDeliveryType(){

    return DropdownButtonFormField(
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
      _previousDeliveryType.text,
      validator: (v) {
        if (v == null) {
          return "Please choose previous delivery type";
        }
       return null;
      },
      onChanged: _currentDeliveryCount.text=="1"?null:(v) {
        _previousDeliveryType.text=v.toString();
      },
    );
  }
  Widget TextInputsexPreviousChild(){

    return Row(
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
              _sexPreviousChild.text,
              onChanged:_currentDeliveryCount.text=="1"?null:
                  (v) {
                setState(
                        () {

                      _sexPreviousChild.text=v.toString();
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
              _sexPreviousChild.text,
              onChanged:_currentDeliveryCount.text=="1"?null:
                  (v) {
                setState(
                        () {
                      sex =
                          v.toString();

                      _sexPreviousChild.text=sex;
                    });
              }),
        )
      ],
    );
  }
  Widget TextInputRCHID(){

    return TextFormField(
      keyboardType: TextInputType.number,
      onSaved: (newValue) => _RCHID.text = newValue!,
      controller: _RCHID,
      // initialValue: newdata!.rchid.toString(),
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: 'RCH ID',
          floatingLabelStyle: MaterialStateTextStyle.resolveWith(
                (Set<MaterialState> states) {
              final Color color = states.contains(MaterialState.error)
                  ? Theme.of(context).colorScheme.error
                  : Colors.blue;
              return TextStyle(color: color, letterSpacing: 1.3);
            },
          ),
        ),
        validator: (String? value) {
          if (value == null || value == '') {
            return 'Enter RCHID';
          }
          return null;
        },
        autovalidateMode: AutovalidateMode.onUserInteraction,
      );
  }
  Widget TextInputCaseNo(){

    return TextFormField(
      onSaved: (newValue) => _Caseno.text= newValue!,
      controller: _Caseno,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'Case No.',
        floatingLabelStyle: MaterialStateTextStyle.resolveWith(
              (Set<MaterialState> states) {
            final Color color = states.contains(MaterialState.error)
                ? Theme.of(context).colorScheme.error
                : Colors.blue;
            return TextStyle(color: color, letterSpacing: 1.3);
          },
        ),
      ),
      validator: (String? value) {
        if (value == null || value == '') {
          return 'Enter Case No.';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }

  Widget TextInputDOB(){

    return TextFormField(
        controller: _DOB,
        decoration: InputDecoration(
          labelText: 'Date of Birth of Mother',
          border: const OutlineInputBorder(),
          floatingLabelStyle: MaterialStateTextStyle.resolveWith(
                (Set<MaterialState> states) {
              final Color color = states.contains(MaterialState.error)
                  ? Theme.of(context).colorScheme.error
                  : Colors.blue;
              return TextStyle(color: color, letterSpacing: 1.3);
            },
          ),
          hintText: "Enter Date of Birth of Mother",),
        onTap: () async{

          DateTime? date = DateTime.now();


          date = await showDatePicker(
              context: context,
              initialDate:DateTime.now(),
              firstDate:DateTime(1900),
              lastDate: DateTime.now());

          if(date!=null) {
            _DOB.text =
            "${date.day < 10 ? "0${date.day}" : date.day}-${date.month < 10
                ? "0${date.month}"
                : date.month}-${date.year}";
          }
        });
  }

  Widget TextInputMotherName(){

    return TextFormField(
      onSaved: (newValue) => _MotherName.text = newValue!,
      controller: _MotherName,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'Mother Name',
        floatingLabelStyle: MaterialStateTextStyle.resolveWith(
              (Set<MaterialState> states) {
            final Color color = states.contains(MaterialState.error)
                ? Theme.of(context).colorScheme.error
                : Colors.blue;
            return TextStyle(color: color, letterSpacing: 1.3);
          },
        ),
      ),
      validator: (String? value) {
        if (value == null || value == '') {
          return 'Enter Mother Name';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
  Widget TextInputHusbandName(){

    return TextFormField(
      onSaved: (newValue) => _HusbandName.text = newValue!,
      controller: _HusbandName,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'Husband Name',
        floatingLabelStyle: MaterialStateTextStyle.resolveWith(
              (Set<MaterialState> states) {
            final Color color = states.contains(MaterialState.error)
                ? Theme.of(context).colorScheme.error
                : Colors.blue;
            return TextStyle(color: color, letterSpacing: 1.3);
          },
        ),
      ),
      validator: (String? value) {
        if (value == null || value == '') {
          return 'Enter Husband Name';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
  Widget TextInputMobileNo(){

    return TextFormField(
      onSaved: (newValue) => _MobileNo.text = newValue!,
      controller: _MobileNo,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'Mobile No.',
        floatingLabelStyle: MaterialStateTextStyle.resolveWith(
              (Set<MaterialState> states) {
            final Color color = states.contains(MaterialState.error)
                ? Theme.of(context).colorScheme.error
                : Colors.blue;
            return TextStyle(color: color, letterSpacing: 1.3);
          },
        ),
      ),
      validator: (String? value) {
        if (value == null || value == '') {
          return 'Enter Mobile No.';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
  Widget TextInputMotherAgeAtMarriage(){

    return TextFormField(
      keyboardType: TextInputType.number,
      onSaved: (newValue) => _MotherAgeAtMarriage.text = newValue!,
      controller: _MotherAgeAtMarriage,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'Mother Age at Marriage',
        floatingLabelStyle: MaterialStateTextStyle.resolveWith(
              (Set<MaterialState> states) {
            final Color color = states.contains(MaterialState.error)
                ? Theme.of(context).colorScheme.error
                : Colors.blue;
            return TextStyle(color: color, letterSpacing: 1.3);
          },
        ),
      ),
      validator: (String? value) {
        if (value == null || value == '') {
          return 'Enter Mother Age at Marriage';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
  Widget TextInputcurrentAge(){

    return TextFormField(
      keyboardType: TextInputType.number,
      onSaved: (newValue) => _MotherCurentAge.text = newValue!,
      controller: _MotherCurentAge,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'Current Age',
        floatingLabelStyle: MaterialStateTextStyle.resolveWith(
              (Set<MaterialState> states) {
            final Color color = states.contains(MaterialState.error)
                ? Theme.of(context).colorScheme.error
                : Colors.blue;
            return TextStyle(color: color, letterSpacing: 1.3);
          },
        ),
      ),
      validator: (String? value) {
        if (value == null || value == '') {
          return 'Enter Current Age';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }

  Widget TextInputANMName(){

    return TextFormField(
      onSaved: (newValue) => _ANMName.text= newValue!,
      controller: _ANMName,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'ANM Name',
        floatingLabelStyle: MaterialStateTextStyle.resolveWith(
              (Set<MaterialState> states) {
            final Color color = states.contains(MaterialState.error)
                ? Theme.of(context).colorScheme.error
                : Colors.blue;
            return TextStyle(color: color, letterSpacing: 1.3);
          },
        ),
      ),
      validator: (String? value) {
        if (value == null || value == '') {
          return 'Enter ANM Name';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
  Widget TextInputAshaName(){

    return TextFormField(
      onSaved: (newValue) => _ASHAName.text = newValue!,
      controller: _ASHAName,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'ASHA Name',
        floatingLabelStyle: MaterialStateTextStyle.resolveWith(
              (Set<MaterialState> states) {
            final Color color = states.contains(MaterialState.error)
                ? Theme.of(context).colorScheme.error
                : Colors.blue;
            return TextStyle(color: color, letterSpacing: 1.3);
          },
        ),
      ),
      validator: (String? value) {
        if (value == null || value == '') {
          return 'Enter ASHA Name';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
  Widget TextInputGynaecologistName(){

    return TextFormField(
      onSaved: (newValue) => _GynacologistName.text = newValue!,
      controller: _GynacologistName,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'Gynaecologist Name',
        floatingLabelStyle: MaterialStateTextStyle.resolveWith(
              (Set<MaterialState> states) {
            final Color color = states.contains(MaterialState.error)
                ? Theme.of(context).colorScheme.error
                : Colors.blue;
            return TextStyle(color: color, letterSpacing: 1.3);
          },
        ),
      ),
      validator: (String? value) {
        if (value == null || value == '') {
          return 'Enter Gynaecologist Name';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }

  Widget TextInputBankName(){

    return TextFormField(
      onSaved: (newValue) => _BankName.text = newValue!,
      controller: _BankName,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'Bank Name',
        floatingLabelStyle: MaterialStateTextStyle.resolveWith(
              (Set<MaterialState> states) {
            final Color color = states.contains(MaterialState.error)
                ? Theme.of(context).colorScheme.error
                : Colors.blue;
            return TextStyle(color: color, letterSpacing: 1.3);
          },
        ),
      ),
      validator: (String? value) {
        if (value == null || value == '') {
          return 'Enter Bank Name';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
  Widget TextInputAccountNumber(){

    return TextFormField(
      onSaved: (newValue) => _AccountNumber.text = newValue!,
      controller: _AccountNumber,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'A/C No.',
        floatingLabelStyle: MaterialStateTextStyle.resolveWith(
              (Set<MaterialState> states) {
            final Color color = states.contains(MaterialState.error)
                ? Theme.of(context).colorScheme.error
                : Colors.blue;
            return TextStyle(color: color, letterSpacing: 1.3);
          },
        ),
      ),
      validator: (String? value) {
        if (value == null || value == '') {
          return 'Enter A/C No.';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
  Widget TextInputIFSCCode(){

    return TextFormField(
      onSaved: (newValue) => _IFSCNo.text = newValue!,
      controller: _IFSCNo,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'IFSC Code',
        floatingLabelStyle: MaterialStateTextStyle.resolveWith(
              (Set<MaterialState> states) {
            final Color color = states.contains(MaterialState.error)
                ? Theme.of(context).colorScheme.error
                : Colors.blue;
            return TextStyle(color: color, letterSpacing: 1.3);
          },
        ),
      ),
      validator: (String? value) {
        if (value == null || value == '') {
          return 'Enter IFSC Code';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
  Widget TextInputAadharCardNo(){

    return TextFormField(
      onSaved: (newValue) => _AadharNo.text = newValue!,
      controller: _AadharNo,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'Aadhar Card No.',
        floatingLabelStyle: MaterialStateTextStyle.resolveWith(
              (Set<MaterialState> states) {
            final Color color = states.contains(MaterialState.error)
                ? Theme.of(context).colorScheme.error
                : Colors.blue;
            return TextStyle(color: color, letterSpacing: 1.3);
          },
        ),
      ),
      validator: (String? value) {
        if (value == null || value == '') {
          return 'Enter Aadhar Card No.';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
  Widget TextInputCaste(){

    return DropdownButtonFormField(
      decoration: getinputstyle(
          hint:
          "Mother Caste Category"),
      hint: Text("Select"),
      items: castes
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
       _Caste.text,
      validator: (v) {
        if (v == null) {
          return "Please choose Mother Caste Category";
        }
        return null;
      },
      onChanged: (v) {
        if(v!=null) {
          _Caste.text = v.toString();
        }
      },
    );
  }
  Widget TextInputEconomicStatus(){

    return DropdownButtonFormField(
      decoration: getinputstyle(
          hint:
          "Select Economy Status"),
      hint: Text("Select"),
      items: economystatus
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
      _EconomicStatus.text,
      validator: (v) {
        if (v == null) {
          return "Please choose Select Economy Status";
        }
        return null;
      },
      onChanged: (v) {
        if(v!=null) {
          _EconomicStatus.text= v.toString();

        }
      },
    );
  }

  Widget TextInputAddress(){

    return TextFormField(
      onSaved: (newValue) => _Address.text = newValue!,
      controller: _Address,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'Address',
        floatingLabelStyle: MaterialStateTextStyle.resolveWith(
              (Set<MaterialState> states) {
            final Color color = states.contains(MaterialState.error)
                ? Theme.of(context).colorScheme.error
                : Colors.blue;
            return TextStyle(color: color, letterSpacing: 1.3);
          },
        ),
      ),
      validator: (String? value) {
        if (value == null || value == '') {
          return 'Enter Address';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
  Widget TextInputRegistrationDate(){
    return TextFormField(
      controller: _RegistrationDateController,
      decoration: InputDecoration(
        labelText: 'Registration Date',
        border: const OutlineInputBorder(),
        floatingLabelStyle: MaterialStateTextStyle.resolveWith(
              (Set<MaterialState> states) {
            final Color color = states.contains(MaterialState.error)
                ? Theme.of(context).colorScheme.error
                : Colors.blue;
            return TextStyle(color: color, letterSpacing: 1.3);
          },
        ),
        hintText: "Registration Date",),
      onTap: () async{

        DateTime? date = DateTime.now();


        date = await showDatePicker(
            context: context,
            initialDate:DateTime.now(),
            firstDate:DateTime(1900),
            lastDate: DateTime.now());
        if(date!=null) {
          _RegistrationDateController.text =
          "${date.day < 10 ? "0${date.day}" : date.day}-${date.month < 10
              ? "0${date.month}"
              : date.month}-${date.year}";
        }
      });
  }

  Widget TextInputGravida(){
    return DropdownButtonFormField(
      decoration: getinputstyle(
          hint:
          "PARA/GRAVIDA"),
      hint: Text("Select"),
      items: para
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
      _ParaGravida.text,
      validator: (v) {
        if (v == null) {
          return "Please choose PARA/GRAVIDA";
        }
        return null;
      },
      onChanged: (v) {
        if(v!=null) {
          _ParaGravida.text = v.toString();
        }
      },
    );
  }

  Widget TextInputLMP(){
    return TextFormField(
        controller: _LMP,
        decoration: InputDecoration(
          labelText: 'LMP Date',
          border: const OutlineInputBorder(),
          floatingLabelStyle: MaterialStateTextStyle.resolveWith(
                (Set<MaterialState> states) {
              final Color color = states.contains(MaterialState.error)
                  ? Theme.of(context).colorScheme.error
                  : Colors.blue;
              return TextStyle(color: color, letterSpacing: 1.3);
            },
          ),
          hintText: "LMP Date",),
        onTap: () async{

          DateTime? date = DateTime.now();


          date = await showDatePicker(
              context: context,
              initialDate:DateTime.now(),
              firstDate:DateTime(1900),
              lastDate: DateTime(2030));

          if(date!=null) {
            _LMP.text =
            "${date.day < 10 ? "0${date.day}" : date.day}-${date.month < 10
                ? "0${date.month}"
                : date.month}-${date.year}";
          }
        });
  }
  Widget TextInputEDD(){

    return TextFormField(
        controller: _EDD,
        decoration: InputDecoration(
          labelText: 'EDD Date',
          border: const OutlineInputBorder(),
          floatingLabelStyle: MaterialStateTextStyle.resolveWith(
                (Set<MaterialState> states) {
              final Color color = states.contains(MaterialState.error)
                  ? Theme.of(context).colorScheme.error
                  : Colors.blue;
              return TextStyle(color: color, letterSpacing: 1.3);
            },
          ),
          hintText: "EDD Date",),
        onTap: () async{
          DateTime? date = DateTime.now();

          date = await showDatePicker(
              context: context,
              initialDate:DateTime.now(),
              firstDate:DateTime(1900),
              lastDate: DateTime(2030));
          if(date!=null) {
            _EDD.text =
            "${date.day < 10 ? "0${date.day}" : date.day}-${date.month < 10
                ? "0${date.month}"
                : date.month}-${date.year}";
          }
        });
  }

  Widget TextInputWeight(){

    return TextFormField(
      onSaved: (newValue) => _Weight.text = newValue!,
      controller: _Weight,

      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'Weight(in Kg.)',
        floatingLabelStyle: MaterialStateTextStyle.resolveWith(
              (Set<MaterialState> states) {
            final Color color = states.contains(MaterialState.error)
                ? Theme.of(context).colorScheme.error
                : Colors.blue;
            return TextStyle(color: color, letterSpacing: 1.3);
          },
        ),
      ),
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
    FilteringTextInputFormatter
        .allow(RegExp(
        r'[0-9]')),
    ],
      validator: (String? value) {
        if (value == null || value == '') {
          return 'Enter Weight(in Kg.)';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
  Widget TextInputHeightf(){

    return TextFormField(
      onSaved: (newValue) => _Heightf.text = newValue!,
      controller: _Heightf,
      maxLength: 1,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'Height(Feets)',
        counterText: '',
        floatingLabelStyle: MaterialStateTextStyle.resolveWith(
              (Set<MaterialState> states) {
            final Color color = states.contains(MaterialState.error)
                ? Theme.of(context).colorScheme.error
                : Colors.blue;
            return TextStyle(color: color, letterSpacing: 1.3);
          },
        ),
      ),
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter
            .allow(RegExp(
            r'[0-9]')),
      ],
      validator: (String? value) {
        if (value == null || value == '') {
          return 'Enter Height (ft and Inches)';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
  Widget TextInputHeighti(){

    return TextFormField(
      onSaved: (newValue) => _Heighti.text = newValue!,
      controller: _Heighti,
      maxLength: 2,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'Height(Inches)',
        counterText: '',
        floatingLabelStyle: MaterialStateTextStyle.resolveWith(
              (Set<MaterialState> states) {
            final Color color = states.contains(MaterialState.error)
                ? Theme.of(context).colorScheme.error
                : Colors.blue;
            return TextStyle(color: color, letterSpacing: 1.3);
          },
        ),
      ),
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter
            .allow(RegExp(
            r'[0-9]')),
      ],
      validator: (String? value) {
        if (value == null || value == '') {
          return 'Enter Height (ft and Inches)';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
  Widget TextInputPastIllness(){

    return TextFormField(
      onSaved: (newValue) => _PastIllness.text = newValue!,
      controller: _PastIllness,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'Past Illness',
        floatingLabelStyle: MaterialStateTextStyle.resolveWith(
              (Set<MaterialState> states) {
            final Color color = states.contains(MaterialState.error)
                ? Theme.of(context).colorScheme.error
                : Colors.blue;
            return TextStyle(color: color, letterSpacing: 1.3);
          },
        ),
      ),
      validator: (String? value) {
        if (value == null || value == '') {
          return 'Enter Past Illness';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
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












}



