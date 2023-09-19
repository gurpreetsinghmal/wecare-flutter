import 'package:Sujatha/screens/GDMOScreens/updatepostpregnancy.dart';
import 'package:Sujatha/screens/GDMOScreens/updateprepregnancy.dart';
import 'package:flutter/material.dart';

import '../../models/patient.dart';
/*import '../ANMScreens/updateanc1.dart';
import '../ANMScreens/updateanc2.dart';
import '../ANMScreens/updateanc3.dart';
import '../ANMScreens/updateanc4.dart';
import '../ANMScreens/updateothers.dart';
import '../ANMScreens/updatepersonal.dart';*/

class GdmoPatientSections extends StatefulWidget {
  final Patient p;
  final villagename;
  final ashaname;
  const GdmoPatientSections(this.p, this.villagename, this.ashaname,
      {super.key});

  @override
  State<GdmoPatientSections> createState() => _GdmoPatientSectionsState();
}

class _GdmoPatientSectionsState extends State<GdmoPatientSections> {
  String? temp;
  String? bpsys;
  String? bpdia;
  String? sugarfast;
  String? sugarpost;
  String? urinesugar;
  String? urinealbumin;
  String? risk;
  String? hb;
  String? fundalh;
  String? heartrate;
  String? move;
  String? presentation;
  String? usg;
  String date="";

  @override
  void initState() {
    super.initState();
    var x = widget.p;
    if (x.anc1Date != null) {
      date=x.anc1Date!;
      bpsys = x.anc1BpSystolic;
      bpdia = x.anc1BpDiastolic;
      sugarfast = x.anc1Bloodsugarfasting;
      sugarpost = x.anc1Bloodsugarpost;
      urinesugar = x.anc1Urinesugar;
      urinealbumin = x.anc1Urinealbumin;
      risk = x.anc1Highrisk;
      hb = x.anc1Hblevel;
      fundalh = x.anc1Fundalheight;
      heartrate = x.anc1Foetalheartrate;
      move = x.anc1FoetalMovements;
      usg = x.anc1Usg;
    }
    if (x.anc2Date != null) {
      date=x.anc2Date!;
      bpsys = x.anc2BpSystolic;
      bpdia = x.anc2BpDiastolic;
      sugarfast = x.anc2Bloodsugarfasting;
      sugarpost = x.anc2Bloodsugarpost;
      urinesugar = x.anc2Urinesugar;
      urinealbumin = x.anc2Urinealbumin;
      risk = x.anc2Highrisk;
      hb = x.anc2Hblevel;
      fundalh = x.anc2Fundalheight;
      heartrate = x.anc2Foetalheartrate;
      move = x.anc2FoetalMovements;
      usg = x.anc2Usg;
    }
    if (x.anc3Date != null) {
      date=x.anc3Date!;
      bpsys = x.anc3BpSystolic;
      bpdia = x.anc3BpDiastolic;
      sugarfast = x.anc3Bloodsugarfasting;
      sugarpost = x.anc3Bloodsugarpost;
      urinesugar = x.anc3Urinesugar;
      urinealbumin = x.anc3Urinealbumin;
      risk = x.anc3Highrisk;
      hb = x.anc3Hblevel;
      fundalh = x.anc3Fundalheight;
      heartrate = x.anc3Foetalheartrate;
      move = x.anc3FoetalMovements;
      usg = x.anc3Usg;
    }
    if (x.anc4Date != null) {
      date=x.anc4Date!;
      bpsys = x.anc4BpSystolic;
      bpdia = x.anc4BpDiastolic;
      sugarfast = x.anc4Bloodsugarfasting;
      sugarpost = x.anc4Bloodsugarpost;
      urinesugar = x.anc4Urinesugar;
      urinealbumin = x.anc4Urinealbumin;
      risk = x.anc4Highrisk;
      hb = x.anc4Hblevel;
      fundalh = x.anc4Fundalheight;
      heartrate = x.anc4Foetalheartrate;
      move = x.anc4FoetalMovements;
      usg = x.anc4Usg;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('GDMO Patient Section'),
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        "Patient Basic Details",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Patient Name"),
                            Text(
                              widget.p.name ?? "NA",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Husband Name"),
                            Text(
                              widget.p.husbandName ?? "NA",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Date of Birth"),
                            Text(
                              widget.p.dob ?? "NA",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Village Name"),
                            Text(
                              widget.villagename ?? "NA",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        "Initial Findings",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Patient LMP"),
                            Text(
                              widget.p.lmp ?? "NA",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Patient EDD"),
                            Text(
                              widget.p.edd ?? "NA",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Previous Cesarean"),
                            Text(
                              widget.p.previousDeliveryType == null
                                  ? "NA"
                                  : widget.p.previousDeliveryType == "1"
                                      ? "Yes"
                                      : "No",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        "Latest ANC Findings   "+date,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Blood Pressure Systolic"),
                            bpsys == null
                                ? Text(
                                    "NA",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                : int.parse(bpsys!) > 120
                                    ? Container(
                                        padding: const EdgeInsets.all(3.0),
                                        decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Text(
                                          bpsys! + "-Hypertension",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )
                                    : int.parse(bpsys!) < 90
                                        ? Container(
                                            padding: const EdgeInsets.all(3.0),
                                            decoration: BoxDecoration(
                                                color: Colors.red,
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: Text(
                                              bpsys! + "-Hypotension",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          )
                                        : Text(
                                            bpsys!,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Blood Pressure Diastolic"),
                            bpdia == null
                                ? Text(
                              "NA",
                              style:
                              TextStyle(fontWeight: FontWeight.bold),
                            )
                                : int.parse(bpdia!) > 80
                                ? Container(
                              padding: const EdgeInsets.all(3.0),
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius:
                                  BorderRadius.circular(5)),
                              child: Text(
                                bpdia! + "-Hypertension",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                                : int.parse(bpdia!) < 60
                                ? Container(
                              padding: const EdgeInsets.all(3.0),
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius:
                                  BorderRadius.circular(5)),
                              child: Text(
                                bpdia! + "-Hypotension",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                                : Text(
                              bpdia!,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Blood Sugar Fasting "),
                            sugarfast == null
                                ? Text(
                              "NA",
                              style:
                              TextStyle(fontWeight: FontWeight.bold),
                            )
                                : int.parse(sugarfast!) > 120
                                ? Container(
                              padding: const EdgeInsets.all(3.0),
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius:
                                  BorderRadius.circular(5)),
                              child: Text(
                                sugarfast! + "-Hyperglycemia",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                                : int.parse(sugarfast!) < 80
                                ? Container(
                              padding: const EdgeInsets.all(3.0),
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius:
                                  BorderRadius.circular(5)),
                              child: Text(
                                sugarfast! + "-Hypoglycemia",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                                : Text(
                              sugarfast!,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Blood Sugar Post Prandial"),
                            sugarpost == null
                                ? Text(
                              "NA",
                              style:
                              TextStyle(fontWeight: FontWeight.bold),
                            )
                                : int.parse(sugarpost!) > 140
                                ? Container(
                              padding: const EdgeInsets.all(3.0),
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius:
                                  BorderRadius.circular(5)),
                              child: Text(
                                sugarpost! + "-Hyperglycemia",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                                : int.parse(sugarpost!) < 100
                                ? Container(
                              padding: const EdgeInsets.all(3.0),
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius:
                                  BorderRadius.circular(5)),
                              child: Text(
                                sugarpost! + "-Hypoglycemia",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                                : Text(
                              sugarpost!,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("High Risk"),
                            risk == null
                                ? Text(
                                    "NA",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                : int.parse(risk!) > 0
                                    ? Container(
                                        padding: const EdgeInsets.all(3.0),
                                        decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Text(
                                          "Yes",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )
                                    : Text(
                                        "No",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("HB Level"),
                            hb == null
                                ? Text(
                              "NA",
                              style:
                              TextStyle(fontWeight: FontWeight.bold),
                            )
                                : int.parse(hb!) > 16
                                ? Container(
                              padding: const EdgeInsets.all(3.0),
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius:
                                  BorderRadius.circular(5)),
                              child: Text(
                                hb! + "-Anemia",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                                : int.parse(hb!) < 11
                                ? Container(
                              padding: const EdgeInsets.all(3.0),
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius:
                                  BorderRadius.circular(5)),
                              child: Text(
                                hb! + "-Polyeythemia",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                                : Text(
                              hb!,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Urine Sugar"),
                             urinesugar== null
                                ? Text(
                              "NA",
                              style:
                              TextStyle(fontWeight: FontWeight.bold),
                            )
                                : int.parse(urinesugar!) > 5
                                ? Container(
                              padding: const EdgeInsets.all(3.0),
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius:
                                  BorderRadius.circular(5)),
                              child: Text(
                                urinesugar! + "-Glycosuria",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                                : int.parse(urinesugar!) < 1
                                ? Container(
                              padding: const EdgeInsets.all(3.0),
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius:
                                  BorderRadius.circular(5)),
                              child: Text(
                                urinesugar! + "",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                                : Text(
                               urinesugar!,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Urine ALbumin"),
                            urinealbumin== null
                                ? Text(
                              "NA",
                              style:
                              TextStyle(fontWeight: FontWeight.bold),
                            )
                                : int.parse(urinealbumin!) < 30
                                ? Container(
                              padding: const EdgeInsets.all(3.0),
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius:
                                  BorderRadius.circular(5)),
                              child: Text(
                                urinealbumin! + "",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                                : Text(
                              urinealbumin!,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Fundal Height"),
                            Text(
                              fundalh ?? "NA",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Foetal Heart Rate"),
                            Text(
                              heartrate ?? "NA",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Foetal Movements"),
                            Text(
                              move == null
                                  ? "NA"
                                  : move == "1"
                                      ? "Yes"
                                      : "No",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("USG"),
                            Text(
                              usg == null
                                  ? "NA"
                                  : usg == "1"
                                      ? "Yes"
                                      : "No",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics:
                  NeverScrollableScrollPhysics(), // Number of columns in the grid
              children: [
                /*
                DashboardTile(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => UpdatePersonal(
                            widget.p, widget.villagename, widget.ashaname),
                      ));
                    },
                    title: 'Personal',
                    icon: Icons.person),
                widget.p.regdate != null
                    ? DashboardTile(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => UpdateAnc1(
                                widget.p, widget.villagename, widget.ashaname),
                          ));
                        },
                        title: 'ANC1',
                        icon: Icons.local_hospital)
                    : SizedBox(),
                widget.p.anc1Date != null
                    ? DashboardTile(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => UpdateAnc2(
                                widget.p, widget.villagename, widget.ashaname),
                          ));
                        },
                        title: 'ANC2',
                        icon: Icons.local_hospital)
                    : SizedBox(),
                widget.p.anc2Date != null
                    ? DashboardTile(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => UpdateAnc3(
                                widget.p, widget.villagename, widget.ashaname),
                          ));
                        },
                        title: 'ANC3',
                        icon: Icons.local_hospital)
                    : SizedBox(),
                widget.p.anc3Date != null
                    ? DashboardTile(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => UpdateAnc4(
                                widget.p, widget.villagename, widget.ashaname),
                          ));
                        },
                        title: 'ANC4',
                        icon: Icons.local_hospital)
                    : SizedBox(),
                widget.p.anc4Date != null
                    ? DashboardTile(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => UpdateAnc5(
                                widget.p, widget.villagename, widget.ashaname),
                          ));
                        },
                        title: 'Others',
                        icon: Icons.padding)
                    : SizedBox(),*/
                DashboardTile(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => UpdatePregnancy(widget.p),
                        ),
                      );
                    },
                    title: 'Pregnancy Details',
                    icon: Icons.pregnant_woman),
                DashboardTile(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => UpdatePostPregnancy(widget.p),
                      ));
                    },
                    title: 'Post Pregnancy',
                    icon: Icons.list_alt)
                // Add more tiles as neede
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  DashboardTile({
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      margin: EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap, // Invoke the provided onTap callback
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 48.0,
                color: Colors.blue,
              ),
              SizedBox(height: 8.0),
              Text(title, style: TextStyle(fontSize: 16.0)),
            ],
          ),
        ),
      ),
    );
  }
}
