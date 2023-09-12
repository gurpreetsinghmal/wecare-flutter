import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:Sujatha/models/patient.dart';
import 'package:Sujatha/reusables.dart';


class UpdateAnc1 extends StatefulWidget {
  final Patient p;
  final villagename;
  final ashaname;
  const UpdateAnc1( this.p,this.villagename,this.ashaname,{Key? key}) : super(key: key);

  @override
  State<UpdateAnc1> createState() => _UpdateAnc1State();
}

class _UpdateAnc1State extends State<UpdateAnc1> {
  final _formKey = GlobalKey<FormState>();
  //======================ANC1===========================

  TextEditingController _Anc1Date=TextEditingController();
  TextEditingController _Anc1WeeksofPregnency=TextEditingController();
  TextEditingController _Anc1BP1S=TextEditingController();
  TextEditingController _Anc1BP1D=TextEditingController();
  TextEditingController _Anc1BloodSugarFasting=TextEditingController();
  TextEditingController _Anc1BloodSugarPost=TextEditingController();
  TextEditingController _Anc1HighRisk=TextEditingController();
  TextEditingController _Anc1HBlevel1=TextEditingController();
  TextEditingController _Anc1UrineTestSugar=TextEditingController();
  TextEditingController _Anc1UrineTestAlbumin=TextEditingController();
  TextEditingController _Anc1FolicAcidTabletsCount=TextEditingController();
  TextEditingController _Anc1FolicAcidTabletsDate=TextEditingController();
  TextEditingController _Anc1IFATabletsCount=TextEditingController();
  TextEditingController _Anc1IFATabletsDate=TextEditingController();
  TextEditingController _Anc1FundalHeight=TextEditingController();
  TextEditingController _Anc1FoetalHeartRate=TextEditingController();
  TextEditingController _Anc1FoetalMovements=TextEditingController();
  TextEditingController _Anc1Usg=TextEditingController();
  TextEditingController _Anc1CounsellingAboutDiet=TextEditingController();

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



      //anc1
      _Anc1Date.text=newdata!.anc1Date??"";
      _Anc1WeeksofPregnency.text=newdata!.anc1Weekofpregnancy??"";
      _Anc1BP1S.text=newdata!.anc1BpSystolic??"";
      _Anc1BP1D.text=newdata!.anc1BpDiastolic??"";
      _Anc1BloodSugarFasting.text=newdata!.anc1Bloodsugarfasting??"";
      _Anc1BloodSugarPost.text=newdata!.anc1Bloodsugarpost??"";
      _Anc1HighRisk.text=newdata!.anc1Highrisk??"0";
      _Anc1HBlevel1.text=newdata!.anc1Hblevel??"";
      _Anc1UrineTestSugar.text=newdata!.anc1Urinesugar??"";
      _Anc1UrineTestAlbumin.text=newdata!.anc1Urinealbumin??"";
      _Anc1FolicAcidTabletsCount.text=newdata!.anc1Folictabcount??"";
      _Anc1FolicAcidTabletsDate.text=newdata!.anc1Folicdate??"";
      _Anc1IFATabletsCount.text=newdata!.anc1Ifatabcount??"";
      _Anc1IFATabletsDate.text=newdata!.anc1Ifadate??"";
      _Anc1FundalHeight.text=newdata!.anc1Fundalheight??"";
      _Anc1FoetalHeartRate.text=newdata!.anc1Foetalheartrate??"";
      _Anc1FoetalMovements.text=newdata!.anc1FoetalMovements??"0";
      _Anc1Usg.text=newdata!.anc1Usg??"0";
      _Anc1CounsellingAboutDiet.text=newdata!.anc1Counselling??"0";

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
        title: Text("Update ANC1 Details",style: TextStyle(fontSize: 18,color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                //ANC1

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
                Text("ANC1 Usg"),
                TextInputUsg(),
                SizedBox(height: 20,),

                TextInputCounsellingAboutDiet(),
                SizedBox(height: 20,),
                //submit ANC1
                Row(
                  children: [
                    Expanded(flex: 1,
                      child: ElevatedButton(
                          child: Text("Submit",style: TextStyle(color: Colors.white),),
                          onPressed: () async {
                            // if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            var anc1= {
                              "id": newdata!.id,
                              "access_token": FirebaseAuth.instance.currentUser!.uid,
                              "anc1_date": _Anc1Date.text,
                              "anc1_weekofpregnancy": _Anc1WeeksofPregnency.text,
                              "anc1_bpSystolic": _Anc1BP1S.text,
                              "anc1_bpDiastolic": _Anc1BP1D.text,
                              "anc1_bloodsugarfasting": _Anc1BloodSugarFasting.text,
                              "anc1_bloodsugarpost": _Anc1BloodSugarPost.text,
                              "anc1_highrisk": _Anc1HighRisk.text,
                              "anc1_hblevel": _Anc1HBlevel1.text,
                              "anc1_urinesugar": _Anc1UrineTestSugar.text,
                              "anc1_urinealbumin": _Anc1UrineTestAlbumin.text,
                              "anc1_folictabcount": _Anc1FolicAcidTabletsCount.text,
                              "anc1_folicdate": _Anc1FolicAcidTabletsDate.text,
                              "anc1_ifatabcount": _Anc1IFATabletsCount.text,
                              "anc1_ifadate": _Anc1IFATabletsDate.text,
                              "anc1_fundalheight":_Anc1FundalHeight.text,
                              "anc1_Foetalheartrate":_Anc1FoetalHeartRate.text,
                              "anc1_FoetalMovements":_Anc1FoetalMovements.text,
                              "anc1_usg":_Anc1Usg.text,
                              "anc1_counselling":_Anc1CounsellingAboutDiet.text,
                              "section":"anc1"
                            };

                            print(jsonEncode(anc1));
                            final response = await http.post(
                              Uri.parse('https://vcare.aims.96.lt/api/anmupdatepatient'),
                              headers: <String, String>{
                                'Content-Type': 'application/json; charset=UTF-8',
                              },
                              body: jsonEncode(anc1),
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

  //ANC1
  Widget TextInputDate1(){
    return TextFormField(
        controller:_Anc1Date,
        decoration: InputDecoration(
          labelText: 'ANC1 Date',
          border: const OutlineInputBorder(),
          floatingLabelStyle: MaterialStateTextStyle.resolveWith(
                (Set<MaterialState> states) {
              final Color color = states.contains(MaterialState.error)
                  ? Theme.of(context).colorScheme.error
                  : Colors.blue;
              return TextStyle(color: color, letterSpacing: 1.3);
            },
          ),
          hintText: "ANC1 Date",),
        onTap: () async{
          DateTime? date = DateTime.now();

          date = await showDatePicker(
              context: context,
              initialDate:DateTime.now(),
              firstDate:DateTime(1900),
              lastDate: DateTime(2030));
          if(date!=null) {
            _Anc1Date.text =
            "${date.day < 10 ? "0${date.day}" : date.day}-${date.month < 10
                ? "0${date.month}"
                : date.month}-${date.year}";
          }
        });
  }
  Widget TextInputWeeksOfPregnency(){

    return TextFormField(
      onSaved: (newValue) => _Anc1WeeksofPregnency.text = newValue!,
      controller: _Anc1WeeksofPregnency,
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
      onSaved: (newValue) => _Anc1BP1S.text = newValue!,
      controller: _Anc1BP1S,

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
      onSaved: (newValue) => _Anc1BP1D.text = newValue!,
      controller: _Anc1BP1D,

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
      onSaved: (newValue) => _Anc1BloodSugarFasting.text = newValue!,
      controller: _Anc1BloodSugarFasting,
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
      onSaved: (newValue) => _Anc1BloodSugarPost.text = newValue!,
      controller: _Anc1BloodSugarPost,
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

    return DropdownButtonFormField(
      decoration: getinputstyle(
          hint:
          "High Risk"),
      hint: Text("Select"),
      items: [
        DropdownMenuItem(
            value:"1",
            child: Text("Yes")),
        DropdownMenuItem(
            value:"0",
            child: Text("No")),
      ],
      value:
      _Anc1HighRisk.text,
      validator: (v) {
        if (v == null) {
          return "Please choose";
        }
        return null;
      },
      onChanged: (v) {

        _Anc1HighRisk.text=v.toString();

      },
    );

  }
  Widget TextInputHBLevel1(){
    return TextFormField(
      onSaved: (newValue) => _Anc1HBlevel1.text = newValue!,
      controller: _Anc1HBlevel1,
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
      onSaved: (newValue) => _Anc1UrineTestSugar.text = newValue!,
      controller: _Anc1UrineTestSugar,
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
      onSaved: (newValue) => _Anc1UrineTestAlbumin.text = newValue!,
      controller: _Anc1UrineTestAlbumin,
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
      onSaved: (newValue) => _Anc1FolicAcidTabletsCount.text = newValue!,
      controller: _Anc1FolicAcidTabletsCount,
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
        controller:_Anc1FolicAcidTabletsDate,
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
            _Anc1FolicAcidTabletsDate.text =
            "${date.day < 10 ? "0${date.day}" : date.day}-${date.month < 10
                ? "0${date.month}"
                : date.month}-${date.year}";
          }
        });
  }
  Widget TextInputIFATabletsCount(){

    return TextFormField(
      onSaved: (newValue) => _Anc1IFATabletsCount.text = newValue!,
      controller: _Anc1IFATabletsCount,
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
        controller:_Anc1IFATabletsDate,
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
            _Anc1IFATabletsDate.text =
            "${date.day < 10 ? "0${date.day}" : date.day}-${date.month < 10
                ? "0${date.month}"
                : date.month}-${date.year}";
          }
        });
  }
  Widget TextInputFundalheight1(){

    return TextFormField(
      onSaved: (newValue) => _Anc1FundalHeight.text = newValue!,
      controller: _Anc1FundalHeight,
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
      onSaved: (newValue) => _Anc1FoetalHeartRate.text = newValue!,
      controller: _Anc1FoetalHeartRate,
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
              _Anc1FoetalMovements.text,
              onChanged:
                  (v) {
                setState(
                        () {
                      _Anc1FoetalMovements.text=v.toString();
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
              _Anc1FoetalMovements.text,
              onChanged:
                  (v) {
                setState(
                        () {
                          _Anc1FoetalMovements.text=v.toString();
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
              _Anc1Usg.text,
              onChanged:
                  (v) {
                setState(
                        () {
                          _Anc1Usg.text=v.toString();
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
              _Anc1Usg.text,
              onChanged:
                  (v) {
                setState(
                        () {
                          _Anc1Usg.text=v.toString();
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
        _Anc1CounsellingAboutDiet.text=="1"?"Yes":"No",
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.blue),
      ),
      trailing: Switch(
        value: _Anc1CounsellingAboutDiet.text=="1",
        onChanged: ((value) async {
          setState(() {
            _Anc1CounsellingAboutDiet.text = (value? "1" : "0");
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



