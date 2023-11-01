import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:Sujatha/models/patient.dart';
import 'package:Sujatha/reusables.dart';


class UpdatePregnancy extends StatefulWidget {
  final Patient p;
  const UpdatePregnancy( this.p,{Key? key}) : super(key: key);

  @override
  State<UpdatePregnancy> createState() => _UpdateAnc5State();
}

class _UpdateAnc5State extends State<UpdatePregnancy> {
  final _formKey = GlobalKey<FormState>();

  //=====================miscellaneous============================

  TextEditingController _refergyno=TextEditingController();
  TextEditingController _placeofdelivery=TextEditingController();
  TextEditingController _mcpCardHolder=TextEditingController();

  Patient? newdata;

  @override
  void initState() {

    super.initState();
    setState(() {
      newdata = widget.p;
      _refergyno.text=newdata!.refergyno??"0";
      _placeofdelivery.text=newdata!.siteofdelivery??"";
      _mcpCardHolder.text=newdata!.mcp??"0";

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
        title: Text("Update Delivery Details",style: TextStyle(fontSize: 18,color: Colors.white)),
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
                  Text("Refer Gyno"),
                 TextInputReferGyno(),
                 SizedBox(height: 20,),
          //       // TextInputGynacologistSeeing(),
          //       // SizedBox(height: 20,),
          //       // TextInputMedicalSpecialistSeeing(),
          //       // SizedBox(height: 20,),
          //       // TextInputMedicalOfficerSeeing(),
          //       // SizedBox(height: 20,),
          //       // TextInputMedication(),
          //       // SizedBox(height: 20,),

                 TextInputProposedSiteOfDelivery(),
                 SizedBox(height: 20,),
                 Text("MCP Card Holder"),
                 TextInputMCPHolder(),
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
                                 "refergyno": _refergyno.text,
                                 "siteofdelivery": _placeofdelivery.text,
                                 "mcp": _mcpCardHolder.text,
                                // "siteofdelivery": _ProposedSiteOfDelivery.text,
                                "section":"gdmoprepreg"
                              };

                             final response = await http.post(
                                Uri.parse('https://vcare.aims.96.lt/api/gdmoupdatepatient'),
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

  Widget TextInputReferGyno(){

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
              _refergyno.text,
              onChanged:
                  (v) {
                setState(
                        () {
                          _refergyno.text=v.toString();
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
              _refergyno.text,
              onChanged:
                  (v) {
                setState(
                        () {
                          _refergyno.text=v.toString();
                    });
              }),
        )
      ],
    );
  }

  Widget TextInputMCPHolder(){

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
              _mcpCardHolder.text,
              onChanged:
                  (v) {
                setState(
                        () {
                          _mcpCardHolder.text=v.toString();
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
              _mcpCardHolder.text,
              onChanged:
                  (v) {
                setState(
                        () {
                          _mcpCardHolder.text=v.toString();
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


  Widget TextInputProposedSiteOfDelivery(){

    return TextFormField(
      onSaved: (newValue) => _placeofdelivery.text = newValue!,
      controller: _placeofdelivery,
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



