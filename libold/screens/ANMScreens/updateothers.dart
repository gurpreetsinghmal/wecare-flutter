import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:Sujatha/models/patient.dart';
import 'package:Sujatha/reusables.dart';


class UpdateAnc5 extends StatefulWidget {
  final Patient p;
  final villagename;
  final ashaname;
  const UpdateAnc5( this.p,this.villagename,this.ashaname,{Key? key}) : super(key: key);

  @override
  State<UpdateAnc5> createState() => _UpdateAnc5State();
}

class _UpdateAnc5State extends State<UpdateAnc5> {
  final _formKey = GlobalKey<FormState>();

  //=====================miscellaneous============================

  TextEditingController _JSYBeneficiary=TextEditingController();
  // TextEditingController _GynacologistSeeing=TextEditingController();
  // TextEditingController _MedicalSpecialistSeeing=TextEditingController();
  // TextEditingController _MedicalOfficerSeeing=TextEditingController();
  // TextEditingController _Medication=TextEditingController();
  TextEditingController _AnybadHistory=TextEditingController();
  TextEditingController _AnybadHistoryDetails=TextEditingController();
  TextEditingController _ProposedSiteOfDelivery=TextEditingController();


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

      _JSYBeneficiary.text=newdata!.jSYBeneficiary??"0";
      _AnybadHistory.text=newdata!.badhistory??"0";
      _AnybadHistoryDetails.text=newdata!.badhistoryDetails??"";
      _ProposedSiteOfDelivery.text=newdata!.siteofdelivery??"";
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
        title: Text("Update Details",style: TextStyle(fontSize: 18,color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
               children: [

                /////    additional information switches
                  Text("JSY Beneficiary"),
                 TextInputJSYBeneficiary(),
                 SizedBox(height: 20,),
          //       // TextInputGynacologistSeeing(),
          //       // SizedBox(height: 20,),
          //       // TextInputMedicalSpecialistSeeing(),
          //       // SizedBox(height: 20,),
          //       // TextInputMedicalOfficerSeeing(),
          //       // SizedBox(height: 20,),
          //       // TextInputMedication(),
          //       // SizedBox(height: 20,),
                 Text("Any Bad Obstetric history"),
                  TextInputAnybadHistory(),
                 SizedBox(height: 20,),
                 _AnybadHistory.text=="1"?TextInputAnybadHistoryDetails():SizedBox(width:1,),
                  SizedBox(height: 10,),
                 TextInputProposedSiteOfDelivery(),
                 SizedBox(height: 20,),

                Row(
                    children: [
                      Expanded(flex: 1,
                        child: TextButton(
                            child: Text("Submit",style: TextStyle(color: Colors.white),),
                            onPressed: () async {
                               // if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();

                              var input= {
                                "id": newdata!.id,
                                "access_token": FirebaseAuth.instance
                                    .currentUser!.uid,
                                "JSYBeneficiary": _JSYBeneficiary.text,
                                "badhistory": _AnybadHistory.text,
                                "badhistoryDetails": _AnybadHistoryDetails.text,
                                "siteofdelivery": _ProposedSiteOfDelivery.text,
                                "section":"others"
                              };

                             final response = await http.post(
                                Uri.parse('https://vcare.aims.96.lt/api/anmupdatepatient'),
                                headers: <String, String>{
                                  'Content-Type': 'application/json; charset=UTF-8',
                                },
                                body: jsonEncode(input),
                              );

                              var res=jsonDecode(response.body);
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
                            ,
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.blue
                            )
                        ),)
                    ],
                  )



               ],
            ),
          ),
        ),
      ),
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
  /*Widget TextInputGynacologistSeeing(){

    return TextFormField(
      onSaved: (newValue) => GynacologistSeeing = newValue!,
      controller: _GynacologistSeeing,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'Gynacologist Seeing',
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
          return 'Enter Gynacologist Seeing';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
  Widget TextInputMedicalSpecialistSeeing(){

    return TextFormField(
      onSaved: (newValue) => MedicalSpecialistSeeing = newValue!,
      controller: _MedicalSpecialistSeeing,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'Medical Specialist Seeing',
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
  Widget TextInputMedicalOfficerSeeing(){

    return TextFormField(
      onSaved: (newValue) => MedicalOfficerSeeing = newValue!,
      controller: _MedicalOfficerSeeing,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'Medical Officer Seeing',
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
          return 'Enter Medical Officer Seeing';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
  Widget TextInputMedication(){

    return TextFormField(
      onSaved: (newValue) => Medication = newValue!,
      controller: _Medication,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'Medication',
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
          return 'Enter Medication';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }*/
  Widget TextInputAnybadHistory(){

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
              _AnybadHistory.text,
              onChanged:
                  (v) {
                setState(
                        () {
                          _AnybadHistory.text=v.toString();
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
              _AnybadHistory.text,
              onChanged:
                  (v) {
                setState(
                        () {
                          _AnybadHistory.text=v.toString();
                          _AnybadHistoryDetails.text="";
                    });
              }),
        )
      ],
    );
  }
  Widget TextInputAnybadHistoryDetails(){
    return TextFormField(
      onSaved: (newValue) => _AnybadHistoryDetails.text = newValue!,
      controller: _AnybadHistoryDetails,
      enabled: _AnybadHistory.text=='1'?true:false,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'Bad Obstetric History Details',
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
        if (_AnybadHistory.text=='0'&& (value == null || value == '')) {
          return 'Enter Bad Obstetric History Details';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
  Widget TextInputProposedSiteOfDelivery(){

    return TextFormField(
      onSaved: (newValue) => _ProposedSiteOfDelivery.text = newValue!,
      controller: _ProposedSiteOfDelivery,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'Proposed Site Of Delivery',
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
          return 'Enter Proposed Site Of Delivery';
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



