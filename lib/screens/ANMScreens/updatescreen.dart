import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wecare/reusables.dart';
import 'package:wecare/screens/ANMScreens/PatientANM.dart';

class Updatescreen extends StatefulWidget {
  final id;
  const Updatescreen( this.id,{Key? key}) : super(key: key);

  @override
  State<Updatescreen> createState() => _UpdatescreenState();
}

class _UpdatescreenState extends State<Updatescreen> {
  final _formKey = GlobalKey<FormState>();
  //========================================
  String RCHID="";
  String Caseno="";
  String MotherName="";
  String HusbandName="";
  String MobileNo="";
  String MotherAgeAtMarriage="";
  String MotherCurentAge="";
  String ANMName="";
  String ASHAName="";
  String GynacologistName="";
  String BankName="";
  String AccountNumber="";
  String IFSCNo="";
  String AadharNo="";
  String Caste="";
  String EconomicStatus="";
  String Address="";
  String ParaGravida="";
  String LMP="";
  String EDD="";
  String Weight="";
  String Height="";
  String PastIllness="";

  //======================ANC1===========================
  String Date1="";
  String WeeksofPregnency="";
  String BP1="";
  String FundalHeight="";
  String BloodSugar="";
  String HighRisk="";
  String HBlevel1="";
  String UrineTest="";
  String FolicAcidTablets="";
  String IFATablets="";
  String CounsellingAboutDiet="";
  //======================ANC2===========================
  String Date2="";
  String BP2="";
  String FundalHeight2="";
  String BloodSugar2="";
  String HighRisk2="";
  String HBlevel2="";
  String FoetalHeartRate="";
  String FoetalMovements="";
  String USG="";
  //======================ANC3===========================
  String Date3="";
  String BP3="";
  String FundalHeight3="";
  String BloodSugar3="";
  String HighRisk3="";
  String HBlevel3="";
  String FoetalHeartRate3="";
  String FoetalMovements3="";
  String FoetalPresentation="";
  String USG3="";
  //======================ANC4===========================
  String Date4="";
  String BP4="";
  String FundalHeight4="";
  String BloodSugar4="";
  String HighRisk4="";
  String HBlevel4="";
  String FoetalHeartRate4="";
  String FoetalMovements4="";
  String FoetalPresentation4="";
  String USG4="";

  //=====================miscellaneous============================
  String TT1="";
  String TT2="";
  String TTB="";
  String JSYBeneficiary="";
  String GynacologistSeeing="";
  String MedicalSpecialistSeeing="";
  String MedicalOfficerSeeing="";
  String Medication="";
  String AnybadobstetricHistory="";
  String ProposedSiteOfDelivery="";

  //================================================
  TextEditingController _RCHID=TextEditingController();
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
  TextEditingController RegistrationDateController = TextEditingController();
  TextEditingController _ParaGravida=TextEditingController();
  TextEditingController _LMP=TextEditingController();
  TextEditingController _EDD=TextEditingController();
  TextEditingController _Weight=TextEditingController();
  TextEditingController _Height=TextEditingController();
  TextEditingController _PastIllness=TextEditingController();

  //======================ANC1===========================
  TextEditingController Date1Controller=TextEditingController();
  TextEditingController _WeeksofPregnency=TextEditingController();
  TextEditingController _BP1=TextEditingController();
  TextEditingController _FundalHeight=TextEditingController();
  TextEditingController _BloodSugar=TextEditingController();
  TextEditingController _HighRisk=TextEditingController();
  TextEditingController _HBlevel1=TextEditingController();
  TextEditingController _UrineTest=TextEditingController();
  TextEditingController _FolicAcidTablets=TextEditingController();
  TextEditingController _IFATablets=TextEditingController();
  TextEditingController _CounsellingAboutDiet=TextEditingController();

  //======================ANC2===========================
  TextEditingController Date2Controller=TextEditingController();

  TextEditingController _BP2=TextEditingController();
  TextEditingController _FundalHeight2=TextEditingController();
  TextEditingController _BloodSugar2=TextEditingController();
  TextEditingController _HighRisk2=TextEditingController();
  TextEditingController _HBlevel2=TextEditingController();
  TextEditingController _FoetalHeartRate=TextEditingController();
  TextEditingController _FoetalMovements=TextEditingController();
  TextEditingController _USG=TextEditingController();

  //======================ANC3===========================
  TextEditingController Date3Controller=TextEditingController();

  TextEditingController _BP3=TextEditingController();
  TextEditingController _FundalHeight3=TextEditingController();
  TextEditingController _BloodSugar3=TextEditingController();
  TextEditingController _HighRisk3=TextEditingController();
  TextEditingController _HBlevel3=TextEditingController();
  TextEditingController _FoetalHeartRate3=TextEditingController();
  TextEditingController _FoetalMovements3=TextEditingController();
  TextEditingController _FoetalPresentation=TextEditingController();
  TextEditingController _USG3=TextEditingController();

  //======================ANC4===========================
  TextEditingController Date4Controller=TextEditingController();
  TextEditingController _BP4=TextEditingController();
  TextEditingController _FundalHeight4=TextEditingController();
  TextEditingController _BloodSugar4=TextEditingController();
  TextEditingController _HighRisk4=TextEditingController();
  TextEditingController _HBlevel4=TextEditingController();
  TextEditingController _FoetalHeartRate4=TextEditingController();
  TextEditingController _FoetalMovements4=TextEditingController();
  TextEditingController _FoetalPresentation4=TextEditingController();
  TextEditingController _USG4=TextEditingController();

  //=====================miscellaneous============================
  TextEditingController _TT1=TextEditingController();
  TextEditingController _TT2=TextEditingController();
  TextEditingController _TTB=TextEditingController();
  TextEditingController _JSYBeneficiary=TextEditingController();
  TextEditingController _GynacologistSeeing=TextEditingController();
  TextEditingController _MedicalSpecialistSeeing=TextEditingController();
  TextEditingController _MedicalOfficerSeeing=TextEditingController();
  TextEditingController _Medication=TextEditingController();
  TextEditingController _AnybadobstetricHistory=TextEditingController();
  TextEditingController _ProposedSiteOfDelivery=TextEditingController();



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
                  TextInputRCHID(),
                  SizedBox(height: 20,),
                //   TextInputCaseNo(),
                //   SizedBox(height: 20,),
                  TextInputMotherName(),
                  SizedBox(height: 20,),
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
                TextInputCaste(),
                SizedBox(height: 20,),
                TextInputEconomicStatus(),
                SizedBox(height: 20,),
                TextInputAddress(),
                SizedBox(height: 20,),
                // TextInputRegistrationDate(),
                //
                // SizedBox(height: 20,),
                // TextInputGravida(),
                // SizedBox(height: 20,),
                TextInputLMP(),
                SizedBox(height: 20,),
                TextInputEDD(),
                SizedBox(height: 20,),
                TextInputWeight(),
                SizedBox(height: 20,),
                TextInputHeight(),
                SizedBox(height: 20,),
                TextInputPastIllness(),
                SizedBox(height: 20,),
                Divider(),

                //ANC1
                SizedBox(height: 20,),
                Text("ANC1",style: TextStyle(fontWeight: FontWeight.bold),),
                SizedBox(height: 15,),
                TextInputDate1(),
                SizedBox(height: 20,),
                TextInputWeeksOfPregnency(),
                SizedBox(height: 20,),
                // TextInputBP1(),
                // SizedBox(height: 20,),
                TextInputFundalheight1(),
                SizedBox(height: 20,),
                // TextInputBloodSugar1(),
                // SizedBox(height: 20,),
                TextInputHightRisk1(),
                SizedBox(height: 20,),
                TextInputHBLevel1(),
                SizedBox(height: 20,),
                // TextInputUrineTest(),
                // SizedBox(height: 20,),
                TextInputFolicAcidTablets(),
                SizedBox(height: 20,),
                TextInputIFATablets(),
                SizedBox(height: 20,),
                TextInputCounsellingAboutDiet(),
                SizedBox(height: 20,),
                Divider(),
                //
                //ANC2
                SizedBox(height: 20,),
                Text("ANC2",style: TextStyle(fontWeight: FontWeight.bold),),
                SizedBox(height: 15,),
                TextInputDate2(),
                SizedBox(height: 20,),
                TextInputBP2(),
                SizedBox(height: 20,),
                TextInputBloodSugar2(),
                SizedBox(height: 20,),
                TextInputHightRisk2(),
                SizedBox(height: 20,),
                TextInputHBLevel2(),
                SizedBox(height: 20,),
                TextInputFundalheight2(),
                SizedBox(height: 20,),
                TextInputFoetalheartrate(),
                SizedBox(height: 20,),
                TextInputFoetalMovements(),
                SizedBox(height: 20,),
                TextInputUSG(),
                SizedBox(height: 20,),
                Divider(),

                //ANC3
                SizedBox(height: 20,),
                Text("ANC3",style: TextStyle(fontWeight: FontWeight.bold),),
                SizedBox(height: 15,),
                TextInputDate3(),
                SizedBox(height: 20,),
                TextInputBP3(),
                SizedBox(height: 20,),
                TextInputBloodSugar3(),
                SizedBox(height: 20,),
                TextInputHightRisk3(),
                SizedBox(height: 20,),
                TextInputHBLevel3(),
                SizedBox(height: 20,),
                TextInputFundalheight3(),
                SizedBox(height: 20,),
                TextInputFoetalheartrate3(),
                SizedBox(height: 20,),
                TextInputFoetalMovements3(),
                SizedBox(height: 20,),
                TextInputFoetalPresentation(),
                SizedBox(height: 20,),
                TextInputUSG(),
                SizedBox(height: 20,),
                Divider(),
                //
                // //ANC4
                // SizedBox(height: 20,),
                // Text("ANC4",style: TextStyle(fontWeight: FontWeight.bold),),
                // SizedBox(height: 15,),
                // TextInputDate4(),
                // SizedBox(height: 20,),
                // TextInputBP4(),
                // SizedBox(height: 20,),
                // TextInputBloodSugar4(),
                // SizedBox(height: 20,),
                // TextInputHightRisk4(),
                // SizedBox(height: 20,),
                // TextInputHBLevel4(),
                // SizedBox(height: 20,),
                // TextInputFundalheight4(),
                // SizedBox(height: 20,),
                // TextInputFoetalheartrate4(),
                // SizedBox(height: 20,),
                // TextInputFoetalMovements4(),
                // SizedBox(height: 20,),
                // TextInputFoetalPresentation4(),
                // SizedBox(height: 20,),
                // TextInputUSG4(),
                // SizedBox(height: 20,),
                Divider(),

                //  miscellaneous
                SizedBox(height: 20,),
                TextInputTT1(),
                SizedBox(height: 20,),
                TextInputTT2(),
                SizedBox(height: 20,),
                TextInputTTB(),
                SizedBox(height: 20,),
                TextInputJSYBeneficiary(),
                SizedBox(height: 20,),
                // TextInputGynacologistSeeing(),
                // SizedBox(height: 20,),
                // TextInputMedicalSpecialistSeeing(),
                // SizedBox(height: 20,),
                // TextInputMedicalOfficerSeeing(),
                // SizedBox(height: 20,),
                // TextInputMedication(),
                // SizedBox(height: 20,),
                TextInputAnybadObstetricHistory(),
                SizedBox(height: 20,),
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
                                "id":widget.id,
                                "access_token":FirebaseAuth.instance.currentUser!.uid,
                                "rchid":RCHID,
                                "tt1switch": TT1,
                                "tt2switch": TT2,
                                "ttbswitch": TTB,
                                // "gdmo_id": null,
                                // "gyno_id": null,
                                // "doctor_id": null,
                                "mothername": MotherName,
                                "ageatmarriage": MotherAgeAtMarriage,
                                // "dob": null,
                                "bankname": BankName,
                                "accountno": AccountNumber,
                                "ifsccode": IFSCNo,
                                "caste": Caste,
                                "economy": EconomicStatus,
                                "address": Address,
                                "Lmp": LMP,
                                "edd": EDD,
                                "weight": Weight,
                                "height": Height,
                                "pastillness": PastIllness,
                                "JSYBeneficiary": JSYBeneficiary,
                                "badhistory": AnybadobstetricHistory,
                                "siteofdelivery": ProposedSiteOfDelivery,
                                "anc1_date": Date1,
                                "anc1_weekofpregnancy": WeeksofPregnency,
                                // "anc1_bpSystolic": null,
                                // "anc1_bpDiastolic": null,
                                "anc1_fundalheight": FundalHeight,
                                // "anc1_bloodsugarfasting": null,
                                // "anc1_bloodsugarpost": null,
                                "anc1_highrisk": HighRisk,
                                "anc1_hblevel": null,
                                // "anc1_urinesugar": null,
                                // "anc1_urinealbumin": null,
                                "anc1_folictabcount": FolicAcidTablets,
                                // "anc1_folicdate": null,
                                // "anc1_ifatabcount":null,
                                // "anc1_ifadate": null,
                                "anc1_counselling":CounsellingAboutDiet,

                                "anc2_date": Date2,
                                "anc2_bp": BP2,
                                "anc2_bloodsugar": BloodSugar,
                                "anc2_highrisk": HighRisk2,
                                "anc2_hblevel": HBlevel2,
                                "anc2_fundalheight": FundalHeight2,
                                "anc2_Foetalheartrate": FoetalHeartRate,
                                "anc2_FoetalMovements": FoetalMovements,
                                "anc2_usg": USG,

                                "anc3_date": Date3,
                                "anc3_bp": BP3,
                                "anc3_bloodsugar": BloodSugar3,
                                "anc3_highrisk": HighRisk3,
                                "anc3_hblevel": HBlevel3,
                                "anc3_fundalheight": FundalHeight3,
                                "anc3_Foetalheartrate": FoetalHeartRate3,
                                "anc3_FoetalMovements": FoetalMovements3,
                                "anc3_usg": USG3,

                                "anc4_date": Date4,
                                "anc4_bp": BP4,
                                "anc4_bloodsugar": BloodSugar4,
                                "anc4_highrisk": HighRisk4,
                                "anc4_hblevel": HBlevel4,
                                "anc4_fundalheight": FundalHeight4,
                                "anc4_Foetalheartrate": FoetalHeartRate4,
                                "anc4_FoetalMovements": FoetalMovements4,
                                "anc4_Foetalpresentation": FoetalPresentation4,
                                "anc4_usg": USG4,
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

                               }
                            // }
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

  Widget TextInputRCHID(){

    return TextFormField(
      keyboardType: TextInputType.number,
      onSaved: (newValue) => RCHID = newValue!,
      controller: _RCHID,

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
      onSaved: (newValue) => Caseno= newValue!,
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
  Widget TextInputMotherName(){

    return TextFormField(
      onSaved: (newValue) => MotherName = newValue!,
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
      onSaved: (newValue) => HusbandName = newValue!,
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
      onSaved: (newValue) => MobileNo = newValue!,
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
      onSaved: (newValue) => MotherAgeAtMarriage = newValue!,
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
      onSaved: (newValue) => MotherCurentAge = newValue!,
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
      onSaved: (newValue) => ANMName= newValue!,
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
      onSaved: (newValue) => ASHAName = newValue!,
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
      onSaved: (newValue) => GynacologistName = newValue!,
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
      onSaved: (newValue) => BankName = newValue!,
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
      onSaved: (newValue) => AccountNumber = newValue!,
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
      onSaved: (newValue) => IFSCNo = newValue!,
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
      onSaved: (newValue) => AadharNo = newValue!,
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

    return TextFormField(
      onSaved: (newValue) => Caste = newValue!,
      controller: _Caste,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'Caste',
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
          return 'Enter Caste';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
  Widget TextInputEconomicStatus(){

    return TextFormField(
      onSaved: (newValue) => EconomicStatus = newValue!,
      controller: _EconomicStatus,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'Economic Status',
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
          return 'Enter Economic Status';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
  Widget TextInputAddress(){

    return TextFormField(
      onSaved: (newValue) => Address = newValue!,
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

      controller: RegistrationDateController,
      decoration: InputDecoration(
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
        FocusScope.of(context).requestFocus(new FocusNode());
        DateTime? date = DateTime.now();
        FocusScope.of(context).requestFocus(new FocusNode());

        date = await showDatePicker(
            context: context,
            initialDate:DateTime.now(),
            firstDate:DateTime(1900),
            lastDate: DateTime(2030));

        RegistrationDateController.text = "${date!.day}/${date.month}/${date.year}";});
  }
  Widget TextInputGravida(){

    return TextFormField(
      onSaved: (newValue) => ParaGravida = newValue!,
      controller: _ParaGravida,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'PARA/GRAVIDA',
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
          return 'Enter PARA/GRAVIDA';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
  Widget TextInputLMP(){

    return TextFormField(
      onSaved: (newValue) => LMP = newValue!,
      controller: _LMP,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'LMP',
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
          return 'Enter LMP';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
  Widget TextInputEDD(){

    return TextFormField(
      onSaved: (newValue) => EDD = newValue!,
      controller: _EDD,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'EDD',
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
          return 'Enter EDD';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
  Widget TextInputWeight(){

    return TextFormField(
      onSaved: (newValue) => Weight = newValue!,
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
      validator: (String? value) {
        if (value == null || value == '') {
          return 'Enter Weight(in Kg.)';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
  Widget TextInputHeight(){

    return TextFormField(
      onSaved: (newValue) => Height = newValue!,
      controller: _Height,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'Height (ft and Inches)',
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
          return 'Enter Height (ft and Inches)';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
  Widget TextInputPastIllness(){

    return TextFormField(
      onSaved: (newValue) => PastIllness = newValue!,
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

  //ANC1
  Widget TextInputDate1(){
    return TextFormField(
        controller: Date1Controller,
        decoration: InputDecoration(
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
          FocusScope.of(context).requestFocus(new FocusNode());
          DateTime? date = DateTime.now();
          FocusScope.of(context).requestFocus(new FocusNode());

          date = await showDatePicker(
              context: context,
              initialDate:DateTime.now(),
              firstDate:DateTime(1900),
              lastDate: DateTime(2030));

          Date1Controller.text = "${date!.day}/${date.month}/${date.year}";});
  }
  Widget TextInputWeeksOfPregnency(){

    return TextFormField(
      onSaved: (newValue) => WeeksofPregnency = newValue!,
      controller: _WeeksofPregnency,
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
      validator: (String? value) {
        if (value == null || value == '') {
          return 'Enter RCHID';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
  Widget TextInputBP1(){

    return TextFormField(
      onSaved: (newValue) => BP1 = newValue!,
      controller: _BP1,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'BP(mm Hg)',
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
  Widget TextInputFundalheight1(){

    return TextFormField(
      onSaved: (newValue) => FundalHeight = newValue!,
      controller: _FundalHeight,
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
      validator: (String? value) {
        if (value == null || value == '') {
          return 'Enter Fundal Height';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
  Widget TextInputBloodSugar1(){

    return TextFormField(
      onSaved: (newValue) => BloodSugar = newValue!,
      controller: _BloodSugar,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'Blood Sugar(mg/dl)',
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
          return 'Enter Blood Sugar';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
  Widget TextInputHightRisk1(){

    return TextFormField(
      onSaved: (newValue) => HighRisk = newValue!,
      controller: _HighRisk,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'High Risk',
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
          return 'Enter Height Risk';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
  Widget TextInputHBLevel1(){
    return TextFormField(
      onSaved: (newValue) => HBlevel1 = newValue!,
      controller: _HBlevel1,
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
      validator: (String? value) {
        if (value == null || value == '') {
          return 'Enter HB Level';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
  Widget TextInputUrineTest(){

    return TextFormField(
      onSaved: (newValue) => UrineTest = newValue!,
      controller: _UrineTest,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'Urine Test',
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
          return 'Enter Urine Test';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
  Widget TextInputFolicAcidTablets(){

    return TextFormField(
      onSaved: (newValue) => FolicAcidTablets = newValue!,
      controller: _FolicAcidTablets,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'Folic Acid Tablets',
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
          return 'Enter Folic Acid Tablets';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
  Widget TextInputIFATablets(){

    return TextFormField(
      onSaved: (newValue) => IFATablets = newValue!,
      controller: _IFATablets,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'IFA Tablets',
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
          return 'Enter IFA Tablets';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
  Widget TextInputCounsellingAboutDiet(){

    return TextFormField(
      onSaved: (newValue) => CounsellingAboutDiet = newValue!,
      controller: _CounsellingAboutDiet,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'Counselling About Diet',
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
          return 'Enter Counselling About Diet';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }

  //ANC2
  Widget TextInputDate2(){
    return TextFormField(
        controller: Date2Controller,
        decoration: InputDecoration(
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
          FocusScope.of(context).requestFocus(new FocusNode());
          DateTime? date = DateTime.now();
          FocusScope.of(context).requestFocus(new FocusNode());

          date = await showDatePicker(
              context: context,
              initialDate:DateTime.now(),
              firstDate:DateTime(1900),
              lastDate: DateTime(2030));

          Date2Controller.text = "${date!.day}/${date.month}/${date.year}";});
  }
  Widget TextInputBP2(){

    return TextFormField(
      onSaved: (newValue) => BP2 = newValue!,
      controller: _BP2,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'BP (mm Hg)',
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
          return 'Enter BP';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
  Widget TextInputBloodSugar2(){

    return TextFormField(
      onSaved: (newValue) => BloodSugar2 = newValue!,
      controller: _BloodSugar2,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'Blood Sugar',
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
          return 'Enter Blood Sugar';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
  Widget TextInputHightRisk2(){
    return TextFormField(
      onSaved: (newValue) => HighRisk2 = newValue!,
      controller: _HighRisk2,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'High Risk',
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
          return 'Enter High Risk';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
  Widget TextInputHBLevel2(){

    return TextFormField(
      onSaved: (newValue) => HBlevel2 = newValue!,
      controller: _HBlevel2,
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
      validator: (String? value) {
        if (value == null || value == '') {
          return 'Enter HB Level';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
  Widget TextInputFundalheight2(){

    return TextFormField(
      onSaved: (newValue) => FundalHeight2 = newValue!,
      controller: _FundalHeight2,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'Fundal Height',
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
          return 'Enter Fundal Height';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
  Widget TextInputFoetalheartrate(){

    return TextFormField(
      onSaved: (newValue) => FoetalHeartRate = newValue!,
      controller: _FoetalHeartRate,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'Foetal Heart Rate',
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
          return 'Enter Foetal Heart Rate';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
  Widget TextInputFoetalMovements(){

    return TextFormField(
      onSaved: (newValue) => FoetalMovements = newValue!,
      controller: _FoetalMovements,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'Foetal Movements',
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
          return 'Enter Foetal Movements';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
  Widget TextInputUSG(){

    return TextFormField(
      onSaved: (newValue) => USG = newValue!,
      controller: _USG,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'USG',
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
          return 'Enter USG';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }

  //ANC3
  Widget TextInputDate3(){
    return TextFormField(
        controller: Date3Controller,
        decoration: InputDecoration(
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
          FocusScope.of(context).requestFocus(new FocusNode());
          DateTime? date = DateTime.now();
          FocusScope.of(context).requestFocus(new FocusNode());

          date = await showDatePicker(
              context: context,
              initialDate:DateTime.now(),
              firstDate:DateTime(1900),
              lastDate: DateTime(2030));

          Date3Controller.text = "${date!.day}/${date.month}/${date.year}";});
  }
  Widget TextInputBP3(){

    return TextFormField(
      onSaved: (newValue) => BP3 = newValue!,
      controller: _BP3,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'BP (mm Hg)',
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
          return 'Enter BP';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
  Widget TextInputBloodSugar3(){

    return TextFormField(
      onSaved: (newValue) => BloodSugar3 = newValue!,
      controller: _BloodSugar3,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'Blood Sugar',
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
          return 'Enter Blood Sugar';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
  Widget TextInputHightRisk3(){

    return TextFormField(
      onSaved: (newValue) => HighRisk3 = newValue!,
      controller: _HighRisk3,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'High Risk',
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
          return 'Enter High Risk';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
  Widget TextInputHBLevel3(){

    return TextFormField(
      onSaved: (newValue) => HBlevel3 = newValue!,
      controller: _HBlevel3,
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
      validator: (String? value) {
        if (value == null || value == '') {
          return 'Enter HB Level';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
  Widget TextInputFundalheight3(){

    return TextFormField(
      onSaved: (newValue) => FundalHeight3 = newValue!,
      controller: _FundalHeight3,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'Fundal Height',
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
          return 'Enter Fundal Height';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
  Widget TextInputFoetalheartrate3(){

    return TextFormField(
      onSaved: (newValue) => FoetalHeartRate3 = newValue!,
      controller: _FoetalHeartRate3,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'Foetal Heart Rate',
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
          return 'Enter Foetal Heart Rate';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
  Widget TextInputFoetalMovements3(){

    return TextFormField(
      onSaved: (newValue) => FoetalMovements3 = newValue!,
      controller: _FoetalMovements3,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'Foetal Movements',
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
          return 'Enter Foetal Movements';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
  Widget TextInputFoetalPresentation(){

    return TextFormField(
      onSaved: (newValue) => FoetalPresentation = newValue!,
      controller: _FoetalPresentation,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'Foetal Presentation',
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
          return 'Enter Foetal Presentation';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
  Widget TextInputUSG3(){

    return TextFormField(
      onSaved: (newValue) => USG3 = newValue!,
      controller: _USG3,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'USG',
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
          return 'Enter USG';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }

  //ANC4
  Widget TextInputDate4(){
    return TextFormField(

        controller: Date4Controller,
        decoration: InputDecoration(
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
          FocusScope.of(context).requestFocus(new FocusNode());
          DateTime? date = DateTime.now();
          FocusScope.of(context).requestFocus(new FocusNode());

          date = await showDatePicker(
              context: context,
              initialDate:DateTime.now(),
              firstDate:DateTime(1900),
              lastDate: DateTime(2030));

          Date4Controller.text = "${date!.day}/${date.month}/${date.year}";});
  }
  Widget TextInputBP4(){

    return TextFormField(
      onSaved: (newValue) => BP4 = newValue!,
      controller: _BP4,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'BP (mm Hg)',
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
          return 'Enter BP';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
  Widget TextInputBloodSugar4(){

    return TextFormField(
      onSaved: (newValue) => BloodSugar4 = newValue!,
      controller: _BloodSugar4,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'Blood Sugar',
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
          return 'Enter Blood Sugar';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
  Widget TextInputHightRisk4(){

    return TextFormField(
      onSaved: (newValue) => HighRisk4 = newValue!,
      controller: _HighRisk4,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'High Risk',
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
          return 'Enter High Risk';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
  Widget TextInputHBLevel4(){

    return TextFormField(
      onSaved: (newValue) => HBlevel4 = newValue!,
      controller: _HBlevel4,
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
      validator: (String? value) {
        if (value == null || value == '') {
          return 'Enter HB Level';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
  Widget TextInputFundalheight4(){

    return TextFormField(
      onSaved: (newValue) => FundalHeight4 = newValue!,
      controller: _FundalHeight4,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'Fundal Height',
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
          return 'Enter Fundal Height';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
  Widget TextInputFoetalheartrate4(){

    return TextFormField(
      onSaved: (newValue) => FoetalHeartRate4 = newValue!,
      controller: _FoetalHeartRate4,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'Foetal Heart Rate',
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
          return 'Enter Foetal Heart Rate';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
  Widget TextInputFoetalMovements4(){

    return TextFormField(
      onSaved: (newValue) => FoetalMovements4 = newValue!,
      controller: _FoetalMovements4,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'Foetal Movements',
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
          return 'Enter Foetal Movements';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
  Widget TextInputFoetalPresentation4(){

    return TextFormField(
      onSaved: (newValue) => FoetalPresentation4 = newValue!,
      controller: _FoetalPresentation4,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'Foetal Presentation',
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
          return 'Enter Foetal Presentation';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
  Widget TextInputUSG4(){

    return TextFormField(
      onSaved: (newValue) => USG4 = newValue!,
      controller: _USG4,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'USG',
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
          return 'Enter USG';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }

  //  miscellaneous
  Widget TextInputTT1(){

    return TextFormField(
      onSaved: (newValue) => TT1 = newValue!,
      controller: _TT1,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'TT1',
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
          return 'Enter TT1';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
  Widget TextInputTT2(){

    return TextFormField(
      onSaved: (newValue) => TT2 = newValue!,
      controller: _TT2,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'TT2',
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
          return 'Enter TT2';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
  Widget TextInputTTB(){

    return TextFormField(
      onSaved: (newValue) => TTB = newValue!,
      controller: _TTB,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'TTB',
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
          return 'TTB';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
  Widget TextInputJSYBeneficiary(){

    return TextFormField(
      onSaved: (newValue) => JSYBeneficiary = newValue!,
      controller: _JSYBeneficiary,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'JSY Beneficiary',
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
          return 'Enter JSY Beneficiary';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
  Widget TextInputGynacologistSeeing(){

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
  }
  Widget TextInputAnybadObstetricHistory(){

    return TextFormField(
      onSaved: (newValue) => AnybadobstetricHistory = newValue!,
      controller: _AnybadobstetricHistory,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'Input Any Bad Obstetric History',
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
          return 'Enter Input Any Bad Obstetric History';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
  Widget TextInputProposedSiteOfDelivery(){

    return TextFormField(
      onSaved: (newValue) => ProposedSiteOfDelivery = newValue!,
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











}

