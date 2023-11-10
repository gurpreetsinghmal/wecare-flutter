import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:Sujatha/models/patient.dart';
import 'package:Sujatha/reusables.dart';


class UpdateAnc2 extends StatefulWidget {
  final Patient p;
  final villagename;
  final ashaname;
  const UpdateAnc2( this.p,this.villagename,this.ashaname,{Key? key}) : super(key: key);

  @override
  State<UpdateAnc2> createState() => _UpdateAnc2State();
}

class _UpdateAnc2State extends State<UpdateAnc2> {
  final _formKey = GlobalKey<FormState>();
  //======================ANC2===========================

  TextEditingController _Anc2Date=TextEditingController();
  TextEditingController _Anc2WeeksofPregnency=TextEditingController();
  TextEditingController _Anc2BP1S=TextEditingController();
  TextEditingController _Anc2BP1D=TextEditingController();
  TextEditingController _Anc2BloodSugarFasting=TextEditingController();
  TextEditingController _Anc2BloodSugarPost=TextEditingController();
  TextEditingController _Anc2HighRisk=TextEditingController();
  TextEditingController _Anc2HBlevel1=TextEditingController();
  TextEditingController _Anc2UrineTestSugar=TextEditingController();
  TextEditingController _Anc2UrineTestAlbumin=TextEditingController();
  TextEditingController _Anc2FolicAcidTabletsCount=TextEditingController();
  TextEditingController _Anc2FolicAcidTabletsDate=TextEditingController();
  TextEditingController _Anc2IFATabletsCount=TextEditingController();
  TextEditingController _Anc2IFATabletsDate=TextEditingController();
  TextEditingController _Anc2FundalHeight=TextEditingController();
  TextEditingController _Anc2FoetalHeartRate=TextEditingController();
  TextEditingController _Anc2FoetalMovements=TextEditingController();
  TextEditingController _Anc2Usg=TextEditingController();
  TextEditingController _Anc2CounsellingAboutDiet=TextEditingController();

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



      //anc2
      _Anc2Date.text=newdata!.anc2Date??"";
      _Anc2WeeksofPregnency.text=newdata!.anc2Weekofpregnancy??"";
      _Anc2BP1S.text=newdata!.anc2BpSystolic??"";
      _Anc2BP1D.text=newdata!.anc2BpDiastolic??"";
      _Anc2BloodSugarFasting.text=newdata!.anc2Bloodsugarfasting??"";
      _Anc2BloodSugarPost.text=newdata!.anc2Bloodsugarpost??"";
      _Anc2HighRisk.text=newdata!.highRiskOrNot == true?"1":"0";
      _Anc2HBlevel1.text=newdata!.anc2Hblevel??"";
      _Anc2UrineTestSugar.text=newdata!.anc2Urinesugar??"";
      _Anc2UrineTestAlbumin.text=newdata!.anc2Urinealbumin??"";
      _Anc2FolicAcidTabletsCount.text=newdata!.anc2Folictabcount??"";
      _Anc2FolicAcidTabletsDate.text=newdata!.anc2Folicdate??"";
      _Anc2IFATabletsCount.text=newdata!.anc2Ifatabcount??"";
      _Anc2IFATabletsDate.text=newdata!.anc2Ifadate??"";
      _Anc2FundalHeight.text=newdata!.anc2Fundalheight??"";
      _Anc2FoetalHeartRate.text=newdata!.anc2Foetalheartrate??"";
      _Anc2FoetalMovements.text=newdata!.anc2FoetalMovements??"0";
      _Anc2Usg.text=newdata!.anc2Usg??"0";
      _Anc2CounsellingAboutDiet.text=newdata!.anc2Counselling??"0";

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
        title: Text("Update ANC2 Details",style: TextStyle(fontSize: 18,color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                //ANC2

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
                Text("ANC2 Usg"),
                TextInputUsg(),
                SizedBox(height: 20,),

                TextInputCounsellingAboutDiet(),
                SizedBox(height: 20,),
                //submit ANC2
                Row(
                  children: [
                    Expanded(flex: 1,
                      child: ElevatedButton(
                          child: Text("Submit",style: TextStyle(color: Colors.white),),
                          onPressed: () async {
                            // if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            var anc2= {
                              "id": newdata!.id,
                              "access_token": FirebaseAuth.instance.currentUser!.uid,
                              "anc2_date": _Anc2Date.text,
                              "anc2_weekofpregnancy": _Anc2WeeksofPregnency.text,
                              "anc2_bpSystolic": _Anc2BP1S.text,
                              "anc2_bpDiastolic": _Anc2BP1D.text,
                              "anc2_bloodsugarfasting": _Anc2BloodSugarFasting.text,
                              "anc2_bloodsugarpost": _Anc2BloodSugarPost.text,
                              "anc2_highrisk": _Anc2HighRisk.text,
                              "anc2_hblevel": _Anc2HBlevel1.text,
                              "anc2_urinesugar": _Anc2UrineTestSugar.text,
                              "anc2_urinealbumin": _Anc2UrineTestAlbumin.text,
                              "anc2_folictabcount": _Anc2FolicAcidTabletsCount.text,
                              "anc2_folicdate": _Anc2FolicAcidTabletsDate.text,
                              "anc2_ifatabcount": _Anc2IFATabletsCount.text,
                              "anc2_ifadate": _Anc2IFATabletsDate.text,
                              "anc2_fundalheight":_Anc2FundalHeight.text,
                              "anc2_Foetalheartrate":_Anc2FoetalHeartRate.text,
                              "anc2_FoetalMovements":_Anc2FoetalMovements.text,
                              "anc2_usg":_Anc2Usg.text,
                              "anc2_counselling":_Anc2CounsellingAboutDiet.text,
                              "section":"anc2"
                            };

                            print(jsonEncode(anc2));
                            final response = await http.post(
                              Uri.parse('https://vcare.aims.96.lt/api/anmupdatepatient'),
                              headers: <String, String>{
                                'Content-Type': 'application/json; charset=UTF-8',
                              },
                              body: jsonEncode(anc2),
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

  //ANC2
  Widget TextInputDate1(){
    return TextFormField(
        controller:_Anc2Date,
        decoration: InputDecoration(
          labelText: 'ANC2 Date',
          border: const OutlineInputBorder(),
          floatingLabelStyle: MaterialStateTextStyle.resolveWith(
                (Set<MaterialState> states) {
              final Color color = states.contains(MaterialState.error)
                  ? Theme.of(context).colorScheme.error
                  : Colors.blue;
              return TextStyle(color: color, letterSpacing: 1.3);
            },
          ),
          hintText: "ANC2 Date",),
        onTap: () async{
          DateTime? date = DateTime.now();

          date = await showDatePicker(
              context: context,
              initialDate:DateTime.now(),
              firstDate:DateTime(1900),
              lastDate: DateTime(2030));
          if(date!=null) {
            _Anc2Date.text =
            "${date.day < 10 ? "0${date.day}" : date.day}-${date.month < 10
                ? "0${date.month}"
                : date.month}-${date.year}";
          }
        });
  }
  Widget TextInputWeeksOfPregnency(){

    return TextFormField(
      onSaved: (newValue) => _Anc2WeeksofPregnency.text = newValue!,
      controller: _Anc2WeeksofPregnency,
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
      onSaved: (newValue) => _Anc2BP1S.text = newValue!,
      controller: _Anc2BP1S,

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
      onSaved: (newValue) => _Anc2BP1D.text = newValue!,
      controller: _Anc2BP1D,

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
      onSaved: (newValue) => _Anc2BloodSugarFasting.text = newValue!,
      controller: _Anc2BloodSugarFasting,
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
      onSaved: (newValue) => _Anc2BloodSugarPost.text = newValue!,
      controller: _Anc2BloodSugarPost,
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
        _Anc2HighRisk.text,
        validator: (v) {
          if (v == null) {
            return "Please choose";
          }
          return null;
        },
          onChanged: widget.p.highRiskOrNot == true
              ? null
              : (v) {

            _Anc2HighRisk.text=v.toString();
          },
          onTap: () {
            if (_Anc2HighRisk.text == "Yes") {
              return null;
            }
          }
      ),
    );

  }
  Widget TextInputHBLevel1(){
    return TextFormField(
      onSaved: (newValue) => _Anc2HBlevel1.text = newValue!,
      controller: _Anc2HBlevel1,
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
      onSaved: (newValue) => _Anc2UrineTestSugar.text = newValue!,
      controller: _Anc2UrineTestSugar,
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
      onSaved: (newValue) => _Anc2UrineTestAlbumin.text = newValue!,
      controller: _Anc2UrineTestAlbumin,
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
      onSaved: (newValue) => _Anc2FolicAcidTabletsCount.text = newValue!,
      controller: _Anc2FolicAcidTabletsCount,
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
        controller:_Anc2FolicAcidTabletsDate,
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
            _Anc2FolicAcidTabletsDate.text =
            "${date.day < 10 ? "0${date.day}" : date.day}-${date.month < 10
                ? "0${date.month}"
                : date.month}-${date.year}";
          }
        });
  }
  Widget TextInputIFATabletsCount(){

    return TextFormField(
      onSaved: (newValue) => _Anc2IFATabletsCount.text = newValue!,
      controller: _Anc2IFATabletsCount,
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
        controller:_Anc2IFATabletsDate,
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
            _Anc2IFATabletsDate.text =
            "${date.day < 10 ? "0${date.day}" : date.day}-${date.month < 10
                ? "0${date.month}"
                : date.month}-${date.year}";
          }
        });
  }
  Widget TextInputFundalheight1(){

    return TextFormField(
      onSaved: (newValue) => _Anc2FundalHeight.text = newValue!,
      controller: _Anc2FundalHeight,
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
      onSaved: (newValue) => _Anc2FoetalHeartRate.text = newValue!,
      controller: _Anc2FoetalHeartRate,
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
              _Anc2FoetalMovements.text,
              onChanged:
                  (v) {
                setState(
                        () {
                      _Anc2FoetalMovements.text=v.toString();
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
              _Anc2FoetalMovements.text,
              onChanged:
                  (v) {
                setState(
                        () {
                      _Anc2FoetalMovements.text=v.toString();
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
              _Anc2Usg.text,
              onChanged:
                  (v) {
                setState(
                        () {
                      _Anc2Usg.text=v.toString();
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
              _Anc2Usg.text,
              onChanged:
                  (v) {
                setState(
                        () {
                      _Anc2Usg.text=v.toString();
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
        _Anc2CounsellingAboutDiet.text=="1"?"Yes":"No",
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.blue),
      ),
      trailing: Switch(
        value: _Anc2CounsellingAboutDiet.text=="1",
        onChanged: ((value) async {
          setState(() {
            _Anc2CounsellingAboutDiet.text = (value? "1" : "0");
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



