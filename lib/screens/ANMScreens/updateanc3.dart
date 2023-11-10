import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:Sujatha/models/patient.dart';
import 'package:Sujatha/reusables.dart';


class UpdateAnc3 extends StatefulWidget {
  final Patient p;
  final villagename;
  final ashaname;
  const UpdateAnc3( this.p,this.villagename,this.ashaname,{Key? key}) : super(key: key);

  @override
  State<UpdateAnc3> createState() => _UpdateAnc3State();
}

class _UpdateAnc3State extends State<UpdateAnc3> {
  final _formKey = GlobalKey<FormState>();
  //======================ANC3===========================

  TextEditingController _Anc3Date=TextEditingController();
  TextEditingController _Anc3WeeksofPregnency=TextEditingController();
  TextEditingController _Anc3BP1S=TextEditingController();
  TextEditingController _Anc3BP1D=TextEditingController();
  TextEditingController _Anc3BloodSugarFasting=TextEditingController();
  TextEditingController _Anc3BloodSugarPost=TextEditingController();
  TextEditingController _Anc3HighRisk=TextEditingController();
  TextEditingController _Anc3HBlevel1=TextEditingController();
  TextEditingController _Anc3UrineTestSugar=TextEditingController();
  TextEditingController _Anc3UrineTestAlbumin=TextEditingController();
  TextEditingController _Anc3FolicAcidTabletsCount=TextEditingController();
  TextEditingController _Anc3FolicAcidTabletsDate=TextEditingController();
  TextEditingController _Anc3IFATabletsCount=TextEditingController();
  TextEditingController _Anc3IFATabletsDate=TextEditingController();
  TextEditingController _Anc3FundalHeight=TextEditingController();
  TextEditingController _Anc3FoetalHeartRate=TextEditingController();
  TextEditingController _Anc3FoetalMovements=TextEditingController();
  TextEditingController _Anc3Usg=TextEditingController();
  TextEditingController _Anc3CounsellingAboutDiet=TextEditingController();

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



      //anc3
      _Anc3Date.text=newdata!.anc3Date??"";
      _Anc3WeeksofPregnency.text=newdata!.anc3Weekofpregnancy??"";
      _Anc3BP1S.text=newdata!.anc3BpSystolic??"";
      _Anc3BP1D.text=newdata!.anc3BpDiastolic??"";
      _Anc3BloodSugarFasting.text=newdata!.anc3Bloodsugarfasting??"";
      _Anc3BloodSugarPost.text=newdata!.anc3Bloodsugarpost??"";
      _Anc3HighRisk.text=newdata!.highRiskOrNot == true?"1":"0";
      _Anc3HBlevel1.text=newdata!.anc3Hblevel??"";
      _Anc3UrineTestSugar.text=newdata!.anc3Urinesugar??"";
      _Anc3UrineTestAlbumin.text=newdata!.anc3Urinealbumin??"";
      _Anc3FolicAcidTabletsCount.text=newdata!.anc3Folictabcount??"";
      _Anc3FolicAcidTabletsDate.text=newdata!.anc3Folicdate??"";
      _Anc3IFATabletsCount.text=newdata!.anc3Ifatabcount??"";
      _Anc3IFATabletsDate.text=newdata!.anc3Ifadate??"";
      _Anc3FundalHeight.text=newdata!.anc3Fundalheight??"";
      _Anc3FoetalHeartRate.text=newdata!.anc3Foetalheartrate??"";
      _Anc3FoetalMovements.text=newdata!.anc3FoetalMovements??"0";
      _Anc3Usg.text=newdata!.anc3Usg??"0";
      _Anc3CounsellingAboutDiet.text=newdata!.anc3Counselling??"0";

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
        title: Text("Update ANC3 Details",style: TextStyle(fontSize: 18,color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                //ANC3

                TextInputDate1(),
                SizedBox(height: 20,),
                TextInputWeeksOfPregnency(),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Expanded(child: TextInputBP1S()),
                    SizedBox(width: 20,),
                    Expanded(child:TextInputBP1D()),
                  ],
                ),

                SizedBox(height: 20,),

                Text("Blood Sugar values"),
                Row(
                  children: [
                    Expanded(child: TextInputBloodSugarFasting()),
                    SizedBox(width: 20,),
                    Expanded(child:TextInputBloodSugarPost()),
                  ],
                ),

                SizedBox(height: 20,),
                Text("High Risk or Not"),
                TextInputHightRisk1(),
                SizedBox(height: 20,),
                TextInputHBLevel1(),
                SizedBox(height: 20,),
                Text("Urine Test"),
                Row(
                  children: [
                    Expanded(child:TextInputUrineSugar()),
                    SizedBox(width: 20,),
                    Expanded(child:TextInputUrineAlbumin()),
                  ],
                ),
                SizedBox(height: 20,),
                Text("Folic Acid Tablets"),
                Row(
                  children: [
                    Expanded(child:TextInputFolicAcidTabletsCount()),
                    SizedBox(width: 20,),
                    Expanded(child:TextInputFolicAcidTabletsDate()),
                  ],
                ),
                SizedBox(height: 20,),
                Text("IFA Tablets"),
                Row(
                  children: [
                    Expanded(child:TextInputIFATabletsCount()),
                    SizedBox(width: 20,),
                    Expanded(child:TextInputIFATabletsDate()),
                  ],
                ),
                SizedBox(height: 20,),
                TextInputFundalheight1(),
                SizedBox(height: 20,),
                TextInputFoetalHeartRate(),
                SizedBox(height: 20,),
                Text("Foetal Movements"),
                TextInputFoetalMovements(),
                SizedBox(height: 20,),
                Text("ANC3 Usg"),
                TextInputUsg(),
                SizedBox(height: 20,),

                TextInputCounsellingAboutDiet(),
                SizedBox(height: 20,),
                //submit ANC3
                Row(
                  children: [
                    Expanded(flex: 1,
                      child: ElevatedButton(
                          child: Text("Submit",style: TextStyle(color: Colors.white),),
                          onPressed: () async {
                            // if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            var anc3= {
                              "id": newdata!.id,
                              "access_token": FirebaseAuth.instance.currentUser!.uid,
                              "anc3_date": _Anc3Date.text,
                              "anc3_weekofpregnancy": _Anc3WeeksofPregnency.text,
                              "anc3_bpSystolic": _Anc3BP1S.text,
                              "anc3_bpDiastolic": _Anc3BP1D.text,
                              "anc3_bloodsugarfasting": _Anc3BloodSugarFasting.text,
                              "anc3_bloodsugarpost": _Anc3BloodSugarPost.text,
                              "anc3_highrisk": _Anc3HighRisk.text,
                              "anc3_hblevel": _Anc3HBlevel1.text,
                              "anc3_urinesugar": _Anc3UrineTestSugar.text,
                              "anc3_urinealbumin": _Anc3UrineTestAlbumin.text,
                              "anc3_folictabcount": _Anc3FolicAcidTabletsCount.text,
                              "anc3_folicdate": _Anc3FolicAcidTabletsDate.text,
                              "anc3_ifatabcount": _Anc3IFATabletsCount.text,
                              "anc3_ifadate": _Anc3IFATabletsDate.text,
                              "anc3_fundalheight":_Anc3FundalHeight.text,
                              "anc3_Foetalheartrate":_Anc3FoetalHeartRate.text,
                              "anc3_FoetalMovements":_Anc3FoetalMovements.text,
                              "anc3_usg":_Anc3Usg.text,
                              "anc3_counselling":_Anc3CounsellingAboutDiet.text,
                              "section":"anc3"
                            };

                            print(jsonEncode(anc3));
                            final response = await http.post(
                              Uri.parse('https://vcare.aims.96.lt/api/anmupdatepatient'),
                              headers: <String, String>{
                                'Content-Type': 'application/json; charset=UTF-8',
                              },
                              body: jsonEncode(anc3),
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

  //ANC3
  Widget TextInputDate1(){
    return TextFormField(
        controller:_Anc3Date,
        decoration: InputDecoration(
          labelText: 'ANC3 Date',
          border: const OutlineInputBorder(),
          floatingLabelStyle: MaterialStateTextStyle.resolveWith(
                (Set<MaterialState> states) {
              final Color color = states.contains(MaterialState.error)
                  ? Theme.of(context).colorScheme.error
                  : Colors.blue;
              return TextStyle(color: color, letterSpacing: 1.3);
            },
          ),
          hintText: "ANC3 Date",),
        onTap: () async{
          DateTime? date = DateTime.now();

          date = await showDatePicker(
              context: context,
              initialDate:DateTime.now(),
              firstDate:DateTime(1900),
              lastDate: DateTime(2030));
          if(date!=null) {
            _Anc3Date.text =
            "${date.day < 10 ? "0${date.day}" : date.day}-${date.month < 10
                ? "0${date.month}"
                : date.month}-${date.year}";
          }
        });
  }
  Widget TextInputWeeksOfPregnency(){

    return TextFormField(
      onSaved: (newValue) => _Anc3WeeksofPregnency.text = newValue!,
      controller: _Anc3WeeksofPregnency,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'Weeks Of Pregnency',
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
          return 'Enter Weeks Of Pregnency';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
  Widget TextInputBP1S(){
    return TextFormField(
      onSaved: (newValue) => _Anc3BP1S.text = newValue!,
      controller: _Anc3BP1S,

      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'BP(Systolic)',
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
  Widget TextInputBP1D(){
    return TextFormField(
      onSaved: (newValue) => _Anc3BP1D.text = newValue!,
      controller: _Anc3BP1D,

      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'BP(Diastolic)',
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

  Widget TextInputBloodSugarFasting(){

    return TextFormField(
      onSaved: (newValue) => _Anc3BloodSugarFasting.text = newValue!,
      controller: _Anc3BloodSugarFasting,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'Blood Sugar Fasting',
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
          return 'Enter Blood Sugar';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
  Widget TextInputBloodSugarPost(){

    return TextFormField(
      onSaved: (newValue) => _Anc3BloodSugarPost.text = newValue!,
      controller: _Anc3BloodSugarPost,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'Blood Sugar Post',
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
          return 'Enter Blood Sugar';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
  Widget TextInputHightRisk1(){

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10), // Set the border radius here
        color: widget.p.highRiskOrNot == true ? Colors.red[100] : null,
      ),
      child: DropdownButtonFormField(
        decoration: getinputstyle(
            hint:
            "High Risk"),
        hint: Text("Select"),
        items: [
          DropdownMenuItem(
              value:"1",
              child: Text("Yes",
                style: TextStyle(
                  //fontSize: widget.p.highRiskOrNot == true? 20 : null, // Increase font size if highRiskOrNot is "1"
                  fontWeight: widget.p.highRiskOrNot == true ? FontWeight.bold : null, // Set to bold if highRiskOrNot is "1"
                  color: widget.p.highRiskOrNot == true ? Colors.black : null,
                ),)),
          DropdownMenuItem(
              value:"0",
              child: Text("No")),
        ],
        value:
        _Anc3HighRisk.text,
        validator: (v) {
          if (v == null) {
            return "Please choose";
          }
          return null;
        },
          onChanged: widget.p.highRiskOrNot == true
              ? null
              : (v) {

            _Anc3HighRisk.text=v.toString();
          },
          onTap: () {
            if (_Anc3HighRisk.text == "Yes") {
              return null;
            }
          }
      ),
    );

  }
  Widget TextInputHBLevel1(){
    return TextFormField(
      onSaved: (newValue) => _Anc3HBlevel1.text = newValue!,
      controller: _Anc3HBlevel1,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'HB Level',
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
          return 'Enter HB Level';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
  Widget TextInputUrineSugar(){

    return TextFormField(
      onSaved: (newValue) => _Anc3UrineTestSugar.text = newValue!,
      controller: _Anc3UrineTestSugar,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'Urine Sugar',
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
          return 'Enter Urine Sugar';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
  Widget TextInputUrineAlbumin(){

    return TextFormField(
      onSaved: (newValue) => _Anc3UrineTestAlbumin.text = newValue!,
      controller: _Anc3UrineTestAlbumin,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'Urine Albumin',
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
          return 'Enter Urine Albumin';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
  Widget TextInputFolicAcidTabletsCount(){

    return TextFormField(
      onSaved: (newValue) => _Anc3FolicAcidTabletsCount.text = newValue!,
      controller: _Anc3FolicAcidTabletsCount,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'No of Tablets',
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
          return 'Enter No of Tablets';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
  Widget TextInputFolicAcidTabletsDate(){
    return TextFormField(
        controller:_Anc3FolicAcidTabletsDate,
        decoration: InputDecoration(
          labelText: 'Date',
          border: const OutlineInputBorder(),
          floatingLabelStyle: MaterialStateTextStyle.resolveWith(
                (Set<MaterialState> states) {
              final Color color = states.contains(MaterialState.error)
                  ? Theme.of(context).colorScheme.error
                  : Colors.blue;
              return TextStyle(color: color, letterSpacing: 1.3);
            },
          ),
          hintText: "Date",),
        onTap: () async{
          DateTime? date = DateTime.now();

          date = await showDatePicker(
              context: context,
              initialDate:DateTime.now(),
              firstDate:DateTime(1900),
              lastDate: DateTime(2030));
          if(date!=null) {
            _Anc3FolicAcidTabletsDate.text =
            "${date.day < 10 ? "0${date.day}" : date.day}-${date.month < 10
                ? "0${date.month}"
                : date.month}-${date.year}";
          }
        });
  }
  Widget TextInputIFATabletsCount(){

    return TextFormField(
      onSaved: (newValue) => _Anc3IFATabletsCount.text = newValue!,
      controller: _Anc3IFATabletsCount,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'No of Tablets',
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
          return 'Enter No of Tablets';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
  Widget TextInputIFATabletsDate(){
    return TextFormField(
        controller:_Anc3IFATabletsDate,
        decoration: InputDecoration(
          labelText: 'Date',
          border: const OutlineInputBorder(),
          floatingLabelStyle: MaterialStateTextStyle.resolveWith(
                (Set<MaterialState> states) {
              final Color color = states.contains(MaterialState.error)
                  ? Theme.of(context).colorScheme.error
                  : Colors.blue;
              return TextStyle(color: color, letterSpacing: 1.3);
            },
          ),
          hintText: "Date",),
        onTap: () async{
          DateTime? date = DateTime.now();

          date = await showDatePicker(
              context: context,
              initialDate:DateTime.now(),
              firstDate:DateTime(1900),
              lastDate: DateTime(2030));
          if(date!=null) {
            _Anc3IFATabletsDate.text =
            "${date.day < 10 ? "0${date.day}" : date.day}-${date.month < 10
                ? "0${date.month}"
                : date.month}-${date.year}";
          }
        });
  }
  Widget TextInputFundalheight1(){

    return TextFormField(
      onSaved: (newValue) => _Anc3FundalHeight.text = newValue!,
      controller: _Anc3FundalHeight,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'Fundal Height(in cm)',
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
          return 'Enter Fundal Height';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
  Widget TextInputFoetalHeartRate(){

    return TextFormField(
      onSaved: (newValue) => _Anc3FoetalHeartRate.text = newValue!,
      controller: _Anc3FoetalHeartRate,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'Foetal Heart Rate(Beats per min)',
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
          return 'Enter Foetal Heart Rate';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
  Widget TextInputFoetalMovements(){
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
              _Anc3FoetalMovements.text,
              onChanged:
                  (v) {
                setState(
                        () {
                      _Anc3FoetalMovements.text=v.toString();
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
              _Anc3FoetalMovements.text,
              onChanged:
                  (v) {
                setState(
                        () {
                      _Anc3FoetalMovements.text=v.toString();
                    });
              }),
        )
      ],
    );
  }
  Widget TextInputUsg(){

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
              _Anc3Usg.text,
              onChanged:
                  (v) {
                setState(
                        () {
                      _Anc3Usg.text=v.toString();
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
              _Anc3Usg.text,
              onChanged:
                  (v) {
                setState(
                        () {
                      _Anc3Usg.text=v.toString();
                    });
              }),
        )
      ],
    );
  }
  Widget TextInputCounsellingAboutDiet(){

    return  ListTile(
      title: Text("Counselling about Diet"),
      subtitle: Text(
        _Anc3CounsellingAboutDiet.text=="1"?"Yes":"No",
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.blue),
      ),
      trailing: Switch(
        value: _Anc3CounsellingAboutDiet.text=="1",
        onChanged: ((value) async {
          setState(() {
            _Anc3CounsellingAboutDiet.text = (value? "1" : "0");
          });
        }),
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



