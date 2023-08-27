import 'dart:convert';

Patient patientFromJson(String str) => Patient.fromJson(json.decode(str));

String patientToJson(Patient data) => json.encode(data.toJson());

class Patient {
  final int? rchid;
  final String? mothername;
  final String? husbandname;
  final int? ageatmarriage;
  final int? dob;
  final int? ashaid;
  final int? anmid;
  final int? gynoid;
  final int? moid;
  final String? bankname;
  final int? accountno;
  final String? ifsccode;
  final String? caste;
  final String? economy;
  final String? address;
  final int? regdate;
  final int? lmp;
  final int? edd;
  final int? weight;
  final int? height;
  final String? pastillness;
  final int? tt1;
  final int? tt2;
  final int? ttb;
  final String? jsyBeneficiary;
  final String? anyBadObstetricHistory;
  final String? proposedSiteOfDelivery;
  final int? anc1Date;
  final int? anc1Weekofpregnancy;
  final int? anc1BpSystolic;
  final int? anc1BpDiastolic;
  final int? anc1Fundalheight;
  final int? anc1Bloodsugarfasting;
  final int? anc1Bloodsugarpost;
  final String? anc1Highrisk;
  final int? anc1Hblevel;
  final int? anc1Urinesugar;
  final int? anc1Urinealbumin;
  final int? anc1Folictabcount;
  final int? anc1Folicdate;
  final int? anc1Ifatabcount;
  final int? anc1Ifadate;
  final String? anc1Counselling;
  final int? anc2Date;
  final int? anc2Bp;
  final int? anc2Bloodsugar;
  final String? anc2Highrisk;
  final int? anc2Hblevel;
  final int? anc2Fundalheight;
  final int? anc2FoetalHeartRate;
  final String? anc2FoetalMovements;
  final String? anc2Usg;
  final int? anc3Date;
  final int? anc3Bp;
  final int? anc3Bloodsugar;
  final String? anc3Highrisk;
  final int? anc3Hblevel;
  final int? anc3Fundalheight;
  final int? anc3FoetalHeartRate;
  final String? anc3FoetalMovements;
  final String? anc3FoetalPresentation;
  final String? anc3Usg;
  final int? anc4Date;
  final int? anc4Bp;
  final int? anc4Bloodsugar;
  final String? anc4Highrisk;
  final int? anc4Hblevel;
  final int? anc4Fundalheight;
  final int? anc4FoetalHeartRate;
  final String? anc4FoetalMovements;
  final String? anc4FoetalPresentation;
  final String? anc4Usg;

  Patient({
    this.rchid,
    this.mothername,
    this.husbandname,
    this.ageatmarriage,
    this.dob,
    this.ashaid,
    this.anmid,
    this.gynoid,
    this.moid,
    this.bankname,
    this.accountno,
    this.ifsccode,
    this.caste,
    this.economy,
    this.address,
    this.regdate,
    this.lmp,
    this.edd,
    this.weight,
    this.height,
    this.pastillness,
    this.tt1,
    this.tt2,
    this.ttb,
    this.jsyBeneficiary,
    this.anyBadObstetricHistory,
    this.proposedSiteOfDelivery,
    this.anc1Date,
    this.anc1Weekofpregnancy,
    this.anc1BpSystolic,
    this.anc1BpDiastolic,
    this.anc1Fundalheight,
    this.anc1Bloodsugarfasting,
    this.anc1Bloodsugarpost,
    this.anc1Highrisk,
    this.anc1Hblevel,
    this.anc1Urinesugar,
    this.anc1Urinealbumin,
    this.anc1Folictabcount,
    this.anc1Folicdate,
    this.anc1Ifatabcount,
    this.anc1Ifadate,
    this.anc1Counselling,
    this.anc2Date,
    this.anc2Bp,
    this.anc2Bloodsugar,
    this.anc2Highrisk,
    this.anc2Hblevel,
    this.anc2Fundalheight,
    this.anc2FoetalHeartRate,
    this.anc2FoetalMovements,
    this.anc2Usg,
    this.anc3Date,
    this.anc3Bp,
    this.anc3Bloodsugar,
    this.anc3Highrisk,
    this.anc3Hblevel,
    this.anc3Fundalheight,
    this.anc3FoetalHeartRate,
    this.anc3FoetalMovements,
    this.anc3FoetalPresentation,
    this.anc3Usg,
    this.anc4Date,
    this.anc4Bp,
    this.anc4Bloodsugar,
    this.anc4Highrisk,
    this.anc4Hblevel,
    this.anc4Fundalheight,
    this.anc4FoetalHeartRate,
    this.anc4FoetalMovements,
    this.anc4FoetalPresentation,
    this.anc4Usg,
  });

  factory Patient.fromJson(Map<String, dynamic> json) => Patient(
    rchid: json["rchid"],
    mothername: json["mothername"],
    husbandname: json["husbandname"],
    ageatmarriage: json["ageatmarriage"],
    dob: json["dob"],
    ashaid: json["ashaid"],
    anmid: json["anmid"],
    gynoid: json["gynoid"],
    moid: json["moid"],
    bankname: json["bankname"],
    accountno: json["accountno"],
    ifsccode: json["ifsccode"],
    caste: json["caste"],
    economy: json["economy"],
    address: json["address"],
    regdate: json["regdate"],
    lmp: json["Lmp"],
    edd: json["edd"],
    weight: json["weight"],
    height: json["height"],
    pastillness: json["pastillness"],
    tt1: json["tt1"],
    tt2: json["tt2"],
    ttb: json["ttb"],
    jsyBeneficiary: json["JSY Beneficiary"],
    anyBadObstetricHistory: json["Any Bad Obstetric history"],
    proposedSiteOfDelivery: json["Proposed site of delivery"],
    anc1Date: json["anc1_date"],
    anc1Weekofpregnancy: json["anc1_weekofpregnancy"],
    anc1BpSystolic: json["anc1_bpSystolic"],
    anc1BpDiastolic: json["anc1_bpDiastolic"],
    anc1Fundalheight: json["anc1_fundalheight"],
    anc1Bloodsugarfasting: json["anc1_bloodsugarfasting"],
    anc1Bloodsugarpost: json["anc1_bloodsugarpost"],
    anc1Highrisk: json["anc1_highrisk"],
    anc1Hblevel: json["anc1_hblevel"],
    anc1Urinesugar: json["anc1_urinesugar"],
    anc1Urinealbumin: json["anc1_urinealbumin"],
    anc1Folictabcount: json["anc1_folictabcount"],
    anc1Folicdate: json["anc1_folicdate"],
    anc1Ifatabcount: json["anc1_ifatabcount"],
    anc1Ifadate: json["anc1_ifadate"],
    anc1Counselling: json["anc1_counselling"],
    anc2Date: json["anc2_date"],
    anc2Bp: json["anc2_bp"],
    anc2Bloodsugar: json["anc2_bloodsugar"],
    anc2Highrisk: json["anc2_highrisk"],
    anc2Hblevel: json["anc2_hblevel"],
    anc2Fundalheight: json["anc2_fundalheight"],
    anc2FoetalHeartRate: json["anc2_Foetal heart rate"],
    anc2FoetalMovements: json["anc2_Foetal Movements"],
    anc2Usg: json["anc2_usg"],
    anc3Date: json["anc3_date"],
    anc3Bp: json["anc3_bp"],
    anc3Bloodsugar: json["anc3_bloodsugar"],
    anc3Highrisk: json["anc3_highrisk"],
    anc3Hblevel: json["anc3_hblevel"],
    anc3Fundalheight: json["anc3_fundalheight"],
    anc3FoetalHeartRate: json["anc3_Foetal heart rate"],
    anc3FoetalMovements: json["anc3_Foetal Movements"],
    anc3FoetalPresentation: json["anc3_Foetal presentation"],
    anc3Usg: json["anc3_usg"],
    anc4Date: json["anc4_date"],
    anc4Bp: json["anc4_bp"],
    anc4Bloodsugar: json["anc4_bloodsugar"],
    anc4Highrisk: json["anc4_highrisk"],
    anc4Hblevel: json["anc4_hblevel"],
    anc4Fundalheight: json["anc4_fundalheight"],
    anc4FoetalHeartRate: json["anc4_Foetal heart rate"],
    anc4FoetalMovements: json["anc4_Foetal Movements"],
    anc4FoetalPresentation: json["anc4_Foetal presentation"],
    anc4Usg: json["anc4_usg"],
  );

  Map<String, dynamic> toJson() => {
    "rchid": rchid,
    "mothername": mothername,
    "husbandname": husbandname,
    "ageatmarriage": ageatmarriage,
    "dob": dob,
    "ashaid": ashaid,
    "anmid": anmid,
    "gynoid": gynoid,
    "moid": moid,
    "bankname": bankname,
    "accountno": accountno,
    "ifsccode": ifsccode,
    "caste": caste,
    "economy": economy,
    "address": address,
    "regdate": regdate,
    "Lmp": lmp,
    "edd": edd,
    "weight": weight,
    "height": height,
    "pastillness": pastillness,
    "tt1": tt1,
    "tt2": tt2,
    "ttb": ttb,
    "JSY Beneficiary": jsyBeneficiary,
    "Any Bad Obstetric history": anyBadObstetricHistory,
    "Proposed site of delivery": proposedSiteOfDelivery,
    "anc1_date": anc1Date,
    "anc1_weekofpregnancy": anc1Weekofpregnancy,
    "anc1_bpSystolic": anc1BpSystolic,
    "anc1_bpDiastolic": anc1BpDiastolic,
    "anc1_fundalheight": anc1Fundalheight,
    "anc1_bloodsugarfasting": anc1Bloodsugarfasting,
    "anc1_bloodsugarpost": anc1Bloodsugarpost,
    "anc1_highrisk": anc1Highrisk,
    "anc1_hblevel": anc1Hblevel,
    "anc1_urinesugar": anc1Urinesugar,
    "anc1_urinealbumin": anc1Urinealbumin,
    "anc1_folictabcount": anc1Folictabcount,
    "anc1_folicdate": anc1Folicdate,
    "anc1_ifatabcount": anc1Ifatabcount,
    "anc1_ifadate": anc1Ifadate,
    "anc1_counselling": anc1Counselling,
    "anc2_date": anc2Date,
    "anc2_bp": anc2Bp,
    "anc2_bloodsugar": anc2Bloodsugar,
    "anc2_highrisk": anc2Highrisk,
    "anc2_hblevel": anc2Hblevel,
    "anc2_fundalheight": anc2Fundalheight,
    "anc2_Foetal heart rate": anc2FoetalHeartRate,
    "anc2_Foetal Movements": anc2FoetalMovements,
    "anc2_usg": anc2Usg,
    "anc3_date": anc3Date,
    "anc3_bp": anc3Bp,
    "anc3_bloodsugar": anc3Bloodsugar,
    "anc3_highrisk": anc3Highrisk,
    "anc3_hblevel": anc3Hblevel,
    "anc3_fundalheight": anc3Fundalheight,
    "anc3_Foetal heart rate": anc3FoetalHeartRate,
    "anc3_Foetal Movements": anc3FoetalMovements,
    "anc3_Foetal presentation": anc3FoetalPresentation,
    "anc3_usg": anc3Usg,
    "anc4_date": anc4Date,
    "anc4_bp": anc4Bp,
    "anc4_bloodsugar": anc4Bloodsugar,
    "anc4_highrisk": anc4Highrisk,
    "anc4_hblevel": anc4Hblevel,
    "anc4_fundalheight": anc4Fundalheight,
    "anc4_Foetal heart rate": anc4FoetalHeartRate,
    "anc4_Foetal Movements": anc4FoetalMovements,
    "anc4_Foetal presentation": anc4FoetalPresentation,
    "anc4_usg": anc4Usg,
  };
}