import 'package:flutter/material.dart';
import 'package:wecare/screens/ANMScreens/updateanc1.dart';
import 'package:wecare/screens/ANMScreens/updateanc2.dart';
import 'package:wecare/screens/ANMScreens/updateanc3.dart';
import 'package:wecare/screens/ANMScreens/updateanc4.dart';
import 'package:wecare/screens/ANMScreens/updateothers.dart';
import 'package:wecare/screens/ANMScreens/updatepersonal.dart';

import '../../models/patient.dart';

class GdmoPatientSections extends StatefulWidget {
  final Patient p;
  final villagename;
  final ashaname;
  const GdmoPatientSections(this.p, this.villagename, this.ashaname, {super.key});

  @override
  State<GdmoPatientSections> createState() => _GdmoPatientSectionsState();
}

class _GdmoPatientSectionsState extends State<GdmoPatientSections> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(

        appBar: AppBar(
          title: Text('GDMO Patient Section'),
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
            }, title: 'Personal', icon: Icons.person),
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
      widget.p.anc4Date!=null?DashboardTile(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        UpdateAnc5(
                            widget.p, widget.villagename, widget.ashaname),
                  ));
                }, title: 'Others', icon: Icons.padding):SizedBox(),
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
