import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:Sujatha/models/patient.dart';
import 'package:Sujatha/reusables.dart';


class UpdateAnc4 extends StatefulWidget {
  final Patient p;
  final villagename;
  final ashaname;
  const UpdateAnc4( this.p,this.villagename,this.ashaname,{Key? key}) : super(key: key);

  @override
  State<UpdateAnc4> createState() => _UpdateAnc4State();
}

class _UpdateAnc4State extends State<UpdateAnc4> {
  final _formKey = GlobalKey<FormState>();
  //======================ANC4===========================

  TextEditingController _Anc4Date=TextEditingController();
  TextEditingController _Anc4WeeksofPregnency=TextEditingController();
  TextEditingController _Anc4BP1S=TextEditingController();
  TextEditingController _Anc4BP1D=TextEditingController();
  TextEditingController _Anc4BloodSugarFasting=TextEditingController();
  TextEditingController _Anc4BloodSugarPost=TextEditingController();
  TextEditingController _Anc4HighRisk=TextEditingController();
  TextEditingController _Anc4HBlevel1=TextEditingController();
  TextEditingController _Anc4UrineTestSugar=TextEditingController();
  TextEditingController _Anc4UrineTestAlbumin=TextEditingController();
  TextEditingController _Anc4FolicAcidTabletsCount=TextEditingController();
  TextEditingController _Anc4FolicAcidTabletsDate=TextEditingController();
  TextEditingController _Anc4IFATabletsCount=TextEditingController();
  TextEditingController _Anc4IFATabletsDate=TextEditingController();
  TextEditingController _Anc4FundalHeight=TextEditingController();
  TextEditingController _Anc4FoetalHeartRate=TextEditingController();
  TextEditingController _Anc4FoetalMovements=TextEditingController();
  TextEditingController _Anc4Usg=TextEditingController();
  TextEditingController _Anc4CounsellingAboutDiet=TextEditingController();

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



      //anc4
      _Anc4Date.text=newdata!.anc4Date??"";
      _Anc4WeeksofPregnency.text=newdata!.anc4Weekofpregnancy??"";
      _Anc4BP1S.text=newdata!.anc4BpSystolic??"";
      _Anc4BP1D.text=newdata!.anc4BpDiastolic??"";
      _Anc4BloodSugarFasting.text=newdata!.anc4Bloodsugarfasting??"";
      _Anc4BloodSugarPost.text=newdata!.anc4Bloodsugarpost??"";
      _Anc4HighRisk.text=newdata!.anc4Highrisk??"0";
      _Anc4HBlevel1.text=newdata!.anc4Hblevel??"";
      _Anc4UrineTestSugar.text=newdata!.anc4Urinesugar??"";
      _Anc4UrineTestAlbumin.text=newdata!.anc4Urinealbumin??"";
      _Anc4FolicAcidTabletsCount.text=newdata!.anc4Folictabcount??"";
      _Anc4FolicAcidTabletsDate.text=newdata!.anc4Folicdate??"";
      _Anc4IFATabletsCount.text=newdata!.anc4Ifatabcount??"";
      _Anc4IFATabletsDate.text=newdata!.anc4Ifadate??"";
      _Anc4FundalHeight.text=newdata!.anc4Fundalheight??"";
      _Anc4FoetalHeartRate.text=newdata!.anc4Foetalheartrate??"";
      _Anc4FoetalMovements.text=newdata!.anc4FoetalMovements??"0";
      _Anc4Usg.text=newdata!.anc4Usg??"0";
      _Anc4CounsellingAboutDiet.text=newdata!.anc4Counselling??"0";

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
        title: Text("Update ANC4 Details",style: TextStyle(fontSize: 18,color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                //ANC4

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
                Text("ANC4 Usg"),
                TextInputUsg(),
                SizedBox(height: 20,),

                TextInputCounsellingAboutDiet(),
                SizedBox(height: 20,),
                //submit ANC4
                Row(
                  children: [
                    Expanded(flex: 1,
                      child: ElevatedButton(
                          child: Text("Submit",style: TextStyle(color: Colors.white),),
                          onPressed: () async {
                            // if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            var anc4= {
                              "id": newdata!.id,
                              "access_token": FirebaseAuth.instance.currentUser!.uid,
                              "anc4_date": _Anc4Date.text,
                              "anc4_weekofpregnancy": _Anc4WeeksofPregnency.text,
                              "anc4_bpSystolic": _Anc4BP1S.text,
                              "anc4_bpDiastolic": _Anc4BP1D.text,
                              "anc4_bloodsugarfasting": _Anc4BloodSugarFasting.text,
                              "anc4_bloodsugarpost": _Anc4BloodSugarPost.text,
                              "anc4_highrisk": _Anc4HighRisk.text,
                              "anc4_hblevel": _Anc4HBlevel1.text,
                              "anc4_urinesugar": _Anc4UrineTestSugar.text,
                              "anc4_urinealbumin": _Anc4UrineTestAlbumin.text,
                              "anc4_folictabcount": _Anc4FolicAcidTabletsCount.text,
                              "anc4_folicdate": _Anc4FolicAcidTabletsDate.text,
                              "anc4_ifatabcount": _Anc4IFATabletsCount.text,
                              "anc4_ifadate": _Anc4IFATabletsDate.text,
                              "anc4_fundalheight":_Anc4FundalHeight.text,
                              "anc4_Foetalheartrate":_Anc4FoetalHeartRate.text,
                              "anc4_FoetalMovements":_Anc4FoetalMovements.text,
                              "anc4_usg":_Anc4Usg.text,
                              "anc4_counselling":_Anc4CounsellingAboutDiet.text,
                              "section":"anc4"
                            };

                            print(jsonEncode(anc4));
                            final response = await http.post(
                              Uri.parse('https://vcare.aims.96.lt/api/anmupdatepatient'),
                              headers: <String, String>{
                                'Content-Type': 'application/json; charset=UTF-8',
                              },
                              body: jsonEncode(anc4),
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

  //ANC4
  Widget TextInputDate1(){
    return TextFormField(
        controller:_Anc4Date,
        decoration: InputDecoration(
          labelText: 'ANC4 Date',
          border: const OutlineInputBorder(),
          floatingLabelStyle: MaterialStateTextStyle.resolveWith(
                (Set<MaterialState> states) {
              final Color color = states.contains(MaterialState.error)
                  ? Theme.of(context).colorScheme.error
                  : Colors.blue;
              return TextStyle(color: color, letterSpacing: 1.3);
            },
          ),
          hintText: "ANC4 Date",),
        onTap: () async{
          DateTime? date = DateTime.now();

          date = await showDatePicker(
              context: context,
              initialDate:DateTime.now(),
              firstDate:DateTime(1900),
              lastDate: DateTime(2030));
          if(date!=null) {
            _Anc4Date.text =
            "${date.day < 10 ? "0${date.day}" : date.day}-${date.month < 10
                ? "0${date.month}"
                : date.month}-${date.year}";
          }
        });
  }
  Widget TextInputWeeksOfPregnency(){

    return TextFormField(
      onSaved: (newValue) => _Anc4WeeksofPregnency.text = newValue!,
      controller: _Anc4WeeksofPregnency,
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
      onSaved: (newValue) => _Anc4BP1S.text = newValue!,
      controller: _Anc4BP1S,

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
      onSaved: (newValue) => _Anc4BP1D.text = newValue!,
      controller: _Anc4BP1D,

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
      onSaved: (newValue) => _Anc4BloodSugarFasting.text = newValue!,
      controller: _Anc4BloodSugarFasting,
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
      onSaved: (newValue) => _Anc4BloodSugarPost.text = newValue!,
      controller: _Anc4BloodSugarPost,
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
      _Anc4HighRisk.text,
      validator: (v) {
        if (v == null) {
          return "Please choose";
        }
        return null;
      },
      onChanged: (v) {

        _Anc4HighRisk.text=v.toString();

      },
    );

  }
  Widget TextInputHBLevel1(){
    return TextFormField(
      onSaved: (newValue) => _Anc4HBlevel1.text = newValue!,
      controller: _Anc4HBlevel1,
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
      onSaved: (newValue) => _Anc4UrineTestSugar.text = newValue!,
      controller: _Anc4UrineTestSugar,
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
      onSaved: (newValue) => _Anc4UrineTestAlbumin.text = newValue!,
      controller: _Anc4UrineTestAlbumin,
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
      onSaved: (newValue) => _Anc4FolicAcidTabletsCount.text = newValue!,
      controller: _Anc4FolicAcidTabletsCount,
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
        controller:_Anc4FolicAcidTabletsDate,
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
            _Anc4FolicAcidTabletsDate.text =
            "${date.day < 10 ? "0${date.day}" : date.day}-${date.month < 10
                ? "0${date.month}"
                : date.month}-${date.year}";
          }
        });
  }
  Widget TextInputIFATabletsCount(){

    return TextFormField(
      onSaved: (newValue) => _Anc4IFATabletsCount.text = newValue!,
      controller: _Anc4IFATabletsCount,
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
        controller:_Anc4IFATabletsDate,
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
            _Anc4IFATabletsDate.text =
            "${date.day < 10 ? "0${date.day}" : date.day}-${date.month < 10
                ? "0${date.month}"
                : date.month}-${date.year}";
          }
        });
  }
  Widget TextInputFundalheight1(){

    return TextFormField(
      onSaved: (newValue) => _Anc4FundalHeight.text = newValue!,
      controller: _Anc4FundalHeight,
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
      onSaved: (newValue) => _Anc4FoetalHeartRate.text = newValue!,
      controller: _Anc4FoetalHeartRate,
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
              _Anc4FoetalMovements.text,
              onChanged:
                  (v) {
                setState(
                        () {
                      _Anc4FoetalMovements.text=v.toString();
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
              _Anc4FoetalMovements.text,
              onChanged:
                  (v) {
                setState(
                        () {
                      _Anc4FoetalMovements.text=v.toString();
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
              _Anc4Usg.text,
              onChanged:
                  (v) {
                setState(
                        () {
                      _Anc4Usg.text=v.toString();
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
              _Anc4Usg.text,
              onChanged:
                  (v) {
                setState(
                        () {
                      _Anc4Usg.text=v.toString();
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
        _Anc4CounsellingAboutDiet.text=="1"?"Yes":"No",
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.blue),
      ),
      trailing: Switch(
        value: _Anc4CounsellingAboutDiet.text=="1",
        onChanged: ((value) async {
          setState(() {
            _Anc4CounsellingAboutDiet.text = (value? "1" : "0");
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



