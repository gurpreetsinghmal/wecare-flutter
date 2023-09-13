import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:Sujatha/models/patient.dart';
import 'package:Sujatha/reusables.dart';


class UpdatePostPregnancy extends StatefulWidget {
  final Patient p;
  const UpdatePostPregnancy( this.p,{Key? key}) : super(key: key);

  @override
  State<UpdatePostPregnancy> createState() => _UpdateAnc5State();
}

class _UpdateAnc5State extends State<UpdatePostPregnancy> {
  final _formKey = GlobalKey<FormState>();

  //=====================miscellaneous============================

  TextEditingController _modeofdelivery=TextEditingController();
  TextEditingController _dateofdelivery=TextEditingController();
  TextEditingController _sexofchild=TextEditingController();

  Patient? newdata;

  final deliverychoices = [
    {"text": "Normal", "val": "0"},
    {"text": "Cesarean", "val": "1"},
  ];

  @override
  void initState() {

    super.initState();
    setState(() {
      newdata = widget.p;
      _modeofdelivery.text=newdata!.modeofdelivery??"0";
      _dateofdelivery.text=newdata!.dateofdelivery??"";
      _sexofchild.text=newdata!.sexofchild??"M";

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
        title: Text("Update Post Delivery Details",style: TextStyle(fontSize: 18,color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
               children: [

                 Text(
                     "Current Delivery Type"),
                 SizedBox(
                   height: 10,
                 ),
                 DropdownButtonFormField(
                   decoration: getinputstyle(
                       hint:
                       "Current Delivery Type"),
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
                   _modeofdelivery.text,
                   validator: (v) {
                     if (v == null) {
                       return "Please choose delivery type";
                     }
                     _modeofdelivery.text =v.toString();
                     return null;
                   },
                   onChanged: (v) {},
                 ),

                 SizedBox(height: 20,),
                 TextInputDateofDelivery(),
          //       // TextInputGynacologistSeeing(),
          //       // SizedBox(height: 20,),
          //       // TextInputMedicalSpecialistSeeing(),
          //       // SizedBox(height: 20,),
          //       // TextInputMedicalOfficerSeeing(),
          //       // SizedBox(height: 20,),
          //       // TextInputMedication(),
          //       // SizedBox(height: 20,),


                 SizedBox(height: 20,),
                 Text("Sex of child"),
                 TextInputDeliverySexChild(),
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
                                 "modeofdelivery": _modeofdelivery.text,
                                 "dateofdelivery": _dateofdelivery.text,
                                 "sexofchild": _sexofchild.text,
                                // "siteofdelivery": _ProposedSiteOfDelivery.text,
                                "section":"gdmopostpreg"
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

  Widget TextInputDeliverySexChild(){
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
              _sexofchild.text,
              onChanged:
                  (v) {
                setState(
                        () {
                          _sexofchild.text=v.toString();
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
              _sexofchild.text,
              onChanged:
                  (v) {
                setState(
                        () {
                          _sexofchild.text=v.toString();
                    });
              }),
        )
      ],
    );
  }

  Widget TextInputDateofDelivery(){

    return TextFormField(
        controller: _dateofdelivery,
        decoration: InputDecoration(
          labelText: 'Date of Delivery',
          border: const OutlineInputBorder(),
          floatingLabelStyle: MaterialStateTextStyle.resolveWith(
                (Set<MaterialState> states) {
              final Color color = states.contains(MaterialState.error)
                  ? Theme.of(context).colorScheme.error
                  : Colors.blue;
              return TextStyle(color: color, letterSpacing: 1.3);
            },
          ),
          hintText: "Enter Date of Delivery",),
        onTap: () async{

          DateTime? date = DateTime.now();


          date = await showDatePicker(
              context: context,
              initialDate:DateTime.now(),
              firstDate:DateTime(1900),
              lastDate: DateTime.now());

          if(date!=null) {
            _dateofdelivery.text =
            "${date.day < 10 ? "0${date.day}" : date.day}-${date.month < 10
                ? "0${date.month}"
                : date.month}-${date.year}";
          }
        });
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



