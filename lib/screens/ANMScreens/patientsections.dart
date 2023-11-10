import 'package:flutter/material.dart';
import 'package:Sujatha/screens/ANMScreens/updateanc1.dart';
import 'package:Sujatha/screens/ANMScreens/updateanc2.dart';
import 'package:Sujatha/screens/ANMScreens/updateanc3.dart';
import 'package:Sujatha/screens/ANMScreens/updateanc4.dart';
import 'package:Sujatha/screens/ANMScreens/updateothers.dart';
import 'package:Sujatha/screens/ANMScreens/updatepersonal.dart';

import '../../models/patient.dart';

class PatientSections extends StatefulWidget {
  final Patient p;
  final villagename;
  final ashaname;
  const PatientSections(this.p, this.villagename, this.ashaname, {super.key});

  @override
  State<PatientSections> createState() => _PatientSectionsState();
}

class _PatientSectionsState extends State<PatientSections> {

  @override
  Widget build(BuildContext context) {
    widget.p.highRiskOrNot = widget.p.anc1Highrisk == "1" || widget.p.anc2Highrisk == "1"  || widget.p.anc3Highrisk == "1"  || widget.p.anc4Highrisk == "1"  ? true : false;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Patient Section'),
        ),
        body: GridView.count(
          crossAxisCount: 3, // Number of columns in the grid
          children: [
            DashboardTile(onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    UpdatePersonal(
                        widget.p, widget.villagename, widget.ashaname),
              ));
            }, title: 'Personal details', icon: Icons.person),
            DashboardTile(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        UpdateAnc5(
                            widget.p, widget.villagename, widget.ashaname),
                  ));
                }, title: 'Other details', icon: Icons.padding),
            widget.p.regdate!=null?DashboardTile(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        UpdateAnc1(
                            widget.p, widget.villagename, widget.ashaname),
                  ));
                },
                title: 'ANC1',
                icon: Icons.local_hospital):SizedBox(),
           widget.p.anc1Date!=null?DashboardTile(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        UpdateAnc2(
                            widget.p, widget.villagename, widget.ashaname),
                  ));
                }, title: 'ANC2', icon: Icons.local_hospital):SizedBox(),
      widget.p.anc2Date!=null?DashboardTile(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        UpdateAnc3(
                            widget.p, widget.villagename, widget.ashaname),
                  ));
                }, title: 'ANC3', icon: Icons.local_hospital):SizedBox(),
      widget.p.anc3Date!=null?DashboardTile(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        UpdateAnc4(
                            widget.p, widget.villagename, widget.ashaname),
                  ));
                }, title: 'ANC4', icon: Icons.local_hospital):SizedBox(),
            // Add more tiles as needed

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
              Icon(icon, size: 48.0,color: Colors.blue,),
              SizedBox(height: 8.0),
              Text(title, style: TextStyle(fontSize: 16.0)),
            ],
          ),
        ),
      ),
    );
  }
}
