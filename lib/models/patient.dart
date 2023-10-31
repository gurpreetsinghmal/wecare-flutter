class Patient {
  int? id;
  String? name;
  String? husbandName;
  int? villageId;
  String? mobile;
  String? abhaId;   //added
  String? bloodgroup;   //added
  String? currDeliveryCount;
  String? prevChildAge;
  String? previousDeliveryType;
  String? sexPreviousChild;
  String? ayushmanId;  //added
  String? tt1switch;
  String? tt2switch;
  String? ttbswitch;
  String? counsDiet;
  int? ashaId;
  int? anmId;
  int? gdmoId;
  int? gynoId;
  int? doctorId;
  String? rchid;
  String? caseno;
  String? mothername;
  String? ageatmarriage;
  String? dob;
  String? bankname;
  String? accountno;
  String? ifsccode;
  String? caste;
  String? economy;
  String? address;
  String? para;
  String? gravida;
  String? abortion;
  String? living;
  String? lmp;
  String? edd;
  String? weight;
  String? heightf;
  String? heighti;
  String? pastillness;

  String? anc1Date;
  String? anc1Weekofpregnancy;
  String? anc1BpSystolic;
  String? anc1BpDiastolic;
  String? anc1Fundalheight;
  String? anc1Bloodsugarfasting;
  String? anc1Bloodsugarpost;
  String? anc1Highrisk;
  String? anc1Hblevel;
  String? anc1Urinesugar;
  String? anc1Urinealbumin;
  String? anc1Folictabcount;
  String? anc1Folicdate;
  String? anc1Ifatabcount;
  String? anc1Ifadate;
  String? anc1Foetalheartrate;
  String? anc1FoetalMovements;
  String? anc1Usg;
  String? anc1Counselling;

  String? anc2Date;
  String? anc2Weekofpregnancy;
  String? anc2BpSystolic;
  String? anc2BpDiastolic;
  String? anc2Fundalheight;
  String? anc2Bloodsugarfasting;
  String? anc2Bloodsugarpost;
  String? anc2Highrisk;
  String? anc2Hblevel;
  String? anc2Urinesugar;
  String? anc2Urinealbumin;
  String? anc2Folictabcount;
  String? anc2Folicdate;
  String? anc2Ifatabcount;
  String? anc2Ifadate;
  String? anc2Foetalheartrate;
  String? anc2FoetalMovements;
  String? anc2Usg;
  String? anc2Counselling;

  String? anc3Date;
  String? anc3Weekofpregnancy;
  String? anc3BpSystolic;
  String? anc3BpDiastolic;
  String? anc3Fundalheight;
  String? anc3Bloodsugarfasting;
  String? anc3Bloodsugarpost;
  String? anc3Highrisk;
  String? anc3Hblevel;
  String? anc3Urinesugar;
  String? anc3Urinealbumin;
  String? anc3Folictabcount;
  String? anc3Folicdate;
  String? anc3Ifatabcount;
  String? anc3Ifadate;
  String? anc3Foetalheartrate;
  String? anc3FoetalMovements;
  String? anc3Usg;
  String? anc3Counselling;

  String? anc4Date;
  String? anc4Weekofpregnancy;
  String? anc4BpSystolic;
  String? anc4BpDiastolic;
  String? anc4Fundalheight;
  String? anc4Bloodsugarfasting;
  String? anc4Bloodsugarpost;
  String? anc4Highrisk;
  String? anc4Hblevel;
  String? anc4Urinesugar;
  String? anc4Urinealbumin;
  String? anc4Folictabcount;
  String? anc4Folicdate;
  String? anc4Ifatabcount;
  String? anc4Ifadate;
  String? anc4Foetalheartrate;
  String? anc4FoetalMovements;
  String? anc4Usg;
  String? anc4Counselling;

  String? jSYBeneficiary;
  String? badhistory;
  String? badhistoryDetails;
  String? siteofdelivery;

  String? refergyno;
  String? mcp;
  String? explained108;
  String? avail108;
  String? doctorAttend;
  String? nurseAttend;
  String? modeofdelivery;
  String? dateofdelivery;
  String? kangaroo;
  String? delayCord;
  String? ballariRakhiya;
  String? sexofchild;


  String? regdate;

  Patient(
      {this.id,
        this.name,
        this.husbandName,
        this.villageId,
        this.mobile,
        this.abhaId,
        this.bloodgroup,
        this.currDeliveryCount,
        this.prevChildAge,
        this.previousDeliveryType,
        this.sexPreviousChild,
        this.ayushmanId,
        this.tt1switch,
        this.tt2switch,
        this.ttbswitch,
        this.counsDiet,
        this.ashaId,
        this.anmId,
        this.gdmoId,
        this.gynoId,
        this.doctorId,
        this.rchid,
        this.caseno,
        this.mothername,
        this.ageatmarriage,
        this.dob,
        this.bankname,
        this.accountno,
        this.ifsccode,
        this.caste,
        this.economy,
        this.address,
        this.para,
        this.lmp,
        this.edd,
        this.weight,
        this.heightf,
        this.heighti,
        this.pastillness,


        this.anc1Date,
        this.anc1Weekofpregnancy,
        this.anc1BpSystolic,
        this.anc1BpDiastolic,
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
        this.anc1Fundalheight,
        this.anc1Foetalheartrate,
        this.anc1FoetalMovements,
        this.anc1Usg,
        this.anc1Counselling,

        this.anc2Date,
        this.anc2Weekofpregnancy,
        this.anc2BpSystolic,
        this.anc2BpDiastolic,
        this.anc2Bloodsugarfasting,
        this.anc2Bloodsugarpost,
        this.anc2Highrisk,
        this.anc2Hblevel,
        this.anc2Urinesugar,
        this.anc2Urinealbumin,
        this.anc2Folictabcount,
        this.anc2Folicdate,
        this.anc2Ifatabcount,
        this.anc2Ifadate,
        this.anc2Fundalheight,
        this.anc2Foetalheartrate,
        this.anc2FoetalMovements,
        this.anc2Usg,
        this.anc2Counselling,

        this.anc3Date,
        this.anc3Weekofpregnancy,
        this.anc3BpSystolic,
        this.anc3BpDiastolic,
        this.anc3Bloodsugarfasting,
        this.anc3Bloodsugarpost,
        this.anc3Highrisk,
        this.anc3Hblevel,
        this.anc3Urinesugar,
        this.anc3Urinealbumin,
        this.anc3Folictabcount,
        this.anc3Folicdate,
        this.anc3Ifatabcount,
        this.anc3Ifadate,
        this.anc3Fundalheight,
        this.anc3Foetalheartrate,
        this.anc3FoetalMovements,
        this.anc3Usg,
        this.anc3Counselling,

        this.anc4Date,
        this.anc4Weekofpregnancy,
        this.anc4BpSystolic,
        this.anc4BpDiastolic,
        this.anc4Bloodsugarfasting,
        this.anc4Bloodsugarpost,
        this.anc4Highrisk,
        this.anc4Hblevel,
        this.anc4Urinesugar,
        this.anc4Urinealbumin,
        this.anc4Folictabcount,
        this.anc4Folicdate,
        this.anc4Ifatabcount,
        this.anc4Ifadate,
        this.anc4Fundalheight,
        this.anc4Foetalheartrate,
        this.anc4FoetalMovements,
        this.anc4Usg,
        this.anc4Counselling,

        this.jSYBeneficiary,
        this.badhistory,
        this.siteofdelivery,
        this.refergyno,
        this.mcp,
        this.explained108,
        this.avail108,
        this.modeofdelivery,
        this.dateofdelivery,
        this.kangaroo,
        this.delayCord,
        this.ballariRakhiya,
        this.sexofchild,

        this.regdate,
      });

  Patient.fromJson(Map<String, dynamic> json) {
    print(json['bloodgroup']);
    id = json['id'];
    name = json['name'];
    husbandName = json['husbandName'];
    villageId = json['village_id'];
    mobile = json['mobile'];
    abhaId = json['abhaId'];
    bloodgroup = json['bloodgroup'];

    currDeliveryCount = json['currDeliveryCount'];
    prevChildAge = json['prevChildAge'];
    previousDeliveryType = json['previousDeliveryType'];
    sexPreviousChild = json['sexPreviousChild'];
    ayushmanId = json['ayushmanId'];
    tt1switch = json['tt1switch'];
    tt2switch = json['tt2switch'];
    ttbswitch = json['ttbswitch'];
    counsDiet = json['counsDiet'];
    ashaId = json['asha_id'];
    anmId = json['anm_id'];
    gdmoId = json['gdmo_id'];
    gynoId = json['gyno_id'];
    doctorId = json['doctor_id'];
    rchid = json['rchid'];
    caseno = json['caseno'];
    mothername = json['mothername'];
    ageatmarriage = json['ageatmarriage'];
    dob = json['dob'];
    bankname = json['bankname'];
    accountno = json['accountno'];
    ifsccode = json['ifsccode'];
    caste = json['caste'];
    economy = json['economy'];
    address = json['address'];
    para = json['para'];
    gravida = json['gravida'];
    abortion = json['abortion'];
    living = json['living'];
    lmp = json['Lmp'];
    edd = json['edd'];
    weight = json['weight'];
    heightf = json['heightf'];
    heighti = json['heighti'];
    pastillness = json['pastillness'];

    anc1Date = json['anc1_date'];
    anc1Weekofpregnancy = json['anc1_weekofpregnancy'];
    anc1BpSystolic = json['anc1_bpSystolic'];
    anc1BpDiastolic = json['anc1_bpDiastolic'];
    anc1Bloodsugarfasting = json['anc1_bloodsugarfasting'];
    anc1Bloodsugarpost = json['anc1_bloodsugarpost'];
    anc1Highrisk = json['anc1_highrisk'];
    anc1Hblevel = json['anc1_hblevel'];
    anc1Urinesugar = json['anc1_urinesugar'];
    anc1Urinealbumin = json['anc1_urinealbumin'];
    anc1Folictabcount = json['anc1_folictabcount'];
    anc1Folicdate = json['anc1_folicdate'];
    anc1Ifatabcount = json['anc1_ifatabcount'];
    anc1Ifadate = json['anc1_ifadate'];
    anc1Fundalheight = json['anc1_fundalheight'];
    anc1Foetalheartrate = json['anc1_Foetalheartrate'];
    anc1FoetalMovements = json['anc1_FoetalMovements'];
    anc1Usg = json['anc1_usg'];
    anc1Counselling = json['anc1_counselling'];

    anc2Date = json['anc2_date'];
    anc2Weekofpregnancy = json['anc2_weekofpregnancy'];
    anc2BpSystolic = json['anc2_bpSystolic'];
    anc2BpDiastolic = json['anc2_bpSystolic'];
    anc2Bloodsugarfasting = json['anc2_bloodsugarfasting'];
    anc2Bloodsugarpost = json['anc2_bloodsugarpost'];
    anc2Highrisk = json['anc2_highrisk'];
    anc2Hblevel = json['anc2_hblevel'];
    anc2Urinesugar = json['anc2_urinesugar'];
    anc2Urinealbumin = json['anc2_urinealbumin'];
    anc2Folictabcount = json['anc2_folictabcount'];
    anc2Folicdate = json['anc2_folicdate'];
    anc2Ifatabcount = json['anc2_ifatabcount'];
    anc2Ifadate = json['anc2_ifadate'];
    anc2Fundalheight = json['anc2_fundalheight'];
    anc2Foetalheartrate = json['anc2_Foetalheartrate'];
    anc2FoetalMovements = json['anc2_FoetalMovements'];
    anc2Usg = json['anc2_usg'];
    anc2Counselling = json['anc2_counselling'];

    anc3Date = json['anc3_date'];
    anc3Weekofpregnancy = json['anc3_weekofpregnancy'];
    anc3BpSystolic = json['anc3_bpSystolic'];
    anc3BpDiastolic = json['anc3_bpSystolic'];
    anc3Bloodsugarfasting = json['anc3_bloodsugarfasting'];
    anc3Bloodsugarpost = json['anc3_bloodsugarpost'];
    anc3Highrisk = json['anc3_highrisk'];
    anc3Hblevel = json['anc3_hblevel'];
    anc3Urinesugar = json['anc3_urinesugar'];
    anc3Urinealbumin = json['anc3_urinealbumin'];
    anc3Folictabcount = json['anc3_folictabcount'];
    anc3Folicdate = json['anc3_folicdate'];
    anc3Ifatabcount = json['anc3_ifatabcount'];
    anc3Ifadate = json['anc3_ifadate'];
    anc3Fundalheight = json['anc3_fundalheight'];
    anc3Foetalheartrate = json['anc3_Foetalheartrate'];
    anc3FoetalMovements = json['anc3_FoetalMovements'];
    anc3Usg = json['anc3_usg'];
    anc3Counselling = json['anc3_counselling'];

    anc4Date = json['anc4_date'];
    anc4Weekofpregnancy = json['anc4_weekofpregnancy'];
    anc4BpSystolic = json['anc4_bpSystolic'];
    anc4BpDiastolic = json['anc4_bpSystolic'];
    anc4Bloodsugarfasting = json['anc4_bloodsugarfasting'];
    anc4Bloodsugarpost = json['anc4_bloodsugarpost'];
    anc4Highrisk = json['anc4_highrisk'];
    anc4Hblevel = json['anc4_hblevel'];
    anc4Urinesugar = json['anc4_urinesugar'];
    anc4Urinealbumin = json['anc4_urinealbumin'];
    anc4Folictabcount = json['anc4_folictabcount'];
    anc4Folicdate = json['anc4_folicdate'];
    anc4Ifatabcount = json['anc4_ifatabcount'];
    anc4Ifadate = json['anc4_ifadate'];
    anc4Fundalheight = json['anc4_fundalheight'];
    anc4Foetalheartrate = json['anc4_Foetalheartrate'];
    anc4FoetalMovements = json['anc4_FoetalMovements'];
    anc4Usg = json['anc4_usg'];
    anc4Counselling = json['anc4_counselling'];

    jSYBeneficiary = json['JSYBeneficiary'];
    badhistory = json['badhistory'];
    badhistoryDetails = json['badhistoryDetails'];
    siteofdelivery = json['siteofdelivery'];

    refergyno = json['refergyno'];
    mcp=json['mcp'];
    explained108=json['explained108'];
    avail108=json['avail108'];
    doctorAttend=json['doctorAttend'];
    nurseAttend=json['nurseAttend'];
    modeofdelivery=json['modeofdelivery'];
    dateofdelivery=json['dateofdelivery'];
    kangaroo=json['kangaroo'];
    delayCord=json['delayCord'];
    ballariRakhiya=json['ballariRakhiya'];
    sexofchild=json['sexofchild'];


    regdate = json['regdate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['husbandName'] = this.husbandName;
    data['village_id'] = this.villageId;
    data['mobile'] = this.mobile;
    data['abhaId'] = this.abhaId;
    data['bloodgroup'] =  this.bloodgroup;
    data['currDeliveryCount'] = this.currDeliveryCount;
    data['prevChildAge'] = this.prevChildAge;
    data['previousDeliveryType'] = this.previousDeliveryType;
    data['sexPreviousChild'] = this.sexPreviousChild;
    data['ayushmanId'] = this.ayushmanId;
    data['tt1switch'] = this.tt1switch;
    data['tt2switch'] = this.tt2switch;
    data['ttbswitch'] = this.ttbswitch;
    data['counsDiet'] = this.counsDiet;
    data['asha_id'] = this.ashaId;
    data['anm_id'] = this.anmId;
    data['gdmo_id'] = this.gdmoId;
    data['gyno_id'] = this.gynoId;
    data['doctor_id'] = this.doctorId;
    data['rchid'] = this.rchid;
    data['caseno'] = this.caseno;
    data['mothername'] = this.mothername;
    data['ageatmarriage'] = this.ageatmarriage;
    data['dob'] = this.dob;
    data['bankname'] = this.bankname;
    data['accountno'] = this.accountno;
    data['ifsccode'] = this.ifsccode;
    data['caste'] = this.caste;
    data['economy'] = this.economy;
    data['address'] = this.address;
    data['para'] = this.para;
    data['gravida'] = this.gravida;
    data['abortion'] = this.abortion;
    data['living'] = this.living;
    data['Lmp'] = this.lmp;
    data['edd'] = this.edd;
    data['weight'] = this.weight;
    data['heightf'] = this.heightf;
    data['heighti'] = this.heighti;
    data['pastillness'] = this.pastillness;


    data['anc1_date'] = this.anc1Date;
    data['anc1_weekofpregnancy'] = this.anc1Weekofpregnancy;
    data['anc1_bpSystolic'] = this.anc1BpSystolic;
    data['anc1_bpDiastolic'] = this.anc1BpDiastolic;
    data['anc1_bloodsugarfasting'] = this.anc1Bloodsugarfasting;
    data['anc1_bloodsugarpost'] = this.anc1Bloodsugarpost;
    data['anc1_highrisk'] = this.anc1Highrisk;
    data['anc1_hblevel'] = this.anc1Hblevel;
    data['anc1_urinesugar'] = this.anc1Urinesugar;
    data['anc1_urinealbumin'] = this.anc1Urinealbumin;
    data['anc1_folictabcount'] = this.anc1Folictabcount;
    data['anc1_folicdate'] = this.anc1Folicdate;
    data['anc1_ifatabcount'] = this.anc1Ifatabcount;
    data['anc1_ifadate'] = this.anc1Ifadate;
    data['anc1_fundalheight'] = this.anc1Fundalheight;
    data['anc1_Foetalheartrate'] = this.anc1Foetalheartrate;
    data['anc1_FoetalMovements'] = this.anc1FoetalMovements;
    data['anc1_usg'] = this.anc1Usg;
    data['anc1_counselling'] = this.anc1Counselling;

    data['anc2_date'] = this.anc2Date;
    data['anc2_weekofpregnancy'] = this.anc2Weekofpregnancy;
    data['anc2_bpSystolic'] = this.anc2BpSystolic;
    data['anc2_bpDiastolic'] = this.anc2BpDiastolic;
    data['anc2_bloodsugarfasting'] = this.anc2Bloodsugarfasting;
    data['anc2_bloodsugarpost'] = this.anc2Bloodsugarpost;
    data['anc2_highrisk'] = this.anc2Highrisk;
    data['anc2_hblevel'] = this.anc2Hblevel;
    data['anc2_urinesugar'] = this.anc2Urinesugar;
    data['anc2_urinealbumin'] = this.anc2Urinealbumin;
    data['anc2_folictabcount'] = this.anc2Folictabcount;
    data['anc2_folicdate'] = this.anc2Folicdate;
    data['anc2_ifatabcount'] = this.anc2Ifatabcount;
    data['anc2_ifadate'] = this.anc2Ifadate;
    data['anc2_fundalheight'] = this.anc2Fundalheight;
    data['anc2_Foetalheartrate'] = this.anc2Foetalheartrate;
    data['anc2_FoetalMovements'] = this.anc2FoetalMovements;
    data['anc2_usg'] = this.anc2Usg;
    data['anc2_counselling'] = this.anc2Counselling;

    data['anc3_date'] = this.anc3Date;
    data['anc3_weekofpregnancy'] = this.anc3Weekofpregnancy;
    data['anc3_bpSystolic'] = this.anc3BpSystolic;
    data['anc3_bpDiastolic'] = this.anc3BpDiastolic;
    data['anc3_bloodsugarfasting'] = this.anc3Bloodsugarfasting;
    data['anc3_bloodsugarpost'] = this.anc3Bloodsugarpost;
    data['anc3_highrisk'] = this.anc3Highrisk;
    data['anc3_hblevel'] = this.anc3Hblevel;
    data['anc3_urinesugar'] = this.anc3Urinesugar;
    data['anc3_urinealbumin'] = this.anc3Urinealbumin;
    data['anc3_folictabcount'] = this.anc3Folictabcount;
    data['anc3_folicdate'] = this.anc3Folicdate;
    data['anc3_ifatabcount'] = this.anc3Ifatabcount;
    data['anc3_ifadate'] = this.anc3Ifadate;
    data['anc3_fundalheight'] = this.anc3Fundalheight;
    data['anc3_Foetalheartrate'] = this.anc3Foetalheartrate;
    data['anc3_FoetalMovements'] = this.anc3FoetalMovements;
    data['anc3_usg'] = this.anc3Usg;
    data['anc3_counselling'] = this.anc3Counselling;

    data['anc4_date'] = this.anc4Date;
    data['anc4_weekofpregnancy'] = this.anc4Weekofpregnancy;
    data['anc4_bpSystolic'] = this.anc4BpSystolic;
    data['anc4_bpDiastolic'] = this.anc4BpDiastolic;
    data['anc4_bloodsugarfasting'] = this.anc4Bloodsugarfasting;
    data['anc4_bloodsugarpost'] = this.anc4Bloodsugarpost;
    data['anc4_highrisk'] = this.anc4Highrisk;
    data['anc4_hblevel'] = this.anc4Hblevel;
    data['anc4_urinesugar'] = this.anc4Urinesugar;
    data['anc4_urinealbumin'] = this.anc4Urinealbumin;
    data['anc4_folictabcount'] = this.anc4Folictabcount;
    data['anc4_folicdate'] = this.anc4Folicdate;
    data['anc4_ifatabcount'] = this.anc4Ifatabcount;
    data['anc4_ifadate'] = this.anc4Ifadate;
    data['anc4_fundalheight'] = this.anc4Fundalheight;
    data['anc4_Foetalheartrate'] = this.anc4Foetalheartrate;
    data['anc4_FoetalMovements'] = this.anc4FoetalMovements;
    data['anc4_usg'] = this.anc4Usg;
    data['anc4_counselling'] = this.anc4Counselling;

    data['JSYBeneficiary'] = this.jSYBeneficiary;
    data['badhistory'] = this.badhistory;
    data['badhistoryDetails'] = this.badhistoryDetails;
    data['siteofdelivery'] = this.siteofdelivery;

    data['refergyno']=this.refergyno;
    data['mcp']=this.mcp;
    data['explained108']=this.explained108;
    data['avail108']=this.avail108;
    data['doctorAttend'] = this.doctorAttend;
    data['nurseAttend'] = this.nurseAttend;
    data['modeofdelivery']=this.modeofdelivery;
    data['dateofdelivery']=this.dateofdelivery;
    data['kangaroo']=this.kangaroo;
    data['delayCord']=this.delayCord;
    data['ballariRakhiya']=this.ballariRakhiya;
    data['sexofchild']=this.sexofchild;


    data['regdate'] = this.regdate;
    return data;
  }
}
