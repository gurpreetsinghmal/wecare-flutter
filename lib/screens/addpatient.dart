import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wecare/reusables.dart';

class AddNewPatient extends StatefulWidget {
  const AddNewPatient({super.key});

  @override
  State<AddNewPatient> createState() => _AddNewPatientState();
}

class _AddNewPatientState extends State<AddNewPatient> {
 
 final _formkey= GlobalKey<FormState>();
 final nameController=TextEditingController();
 String name="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add New Patient")),
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              TextFormField(
                  decoration: InputDecoration(
                  labelText: "Enter Your Name",
                ),
                validator:(value){
                  if(value==null || value.isEmpty){
                      return "Enter Valid Name";
                  }
                  return null;
                },
              ),
              ElevatedButton(onPressed:(){
                if(_formkey.currentState!.validate()){
                  makeSuccesstoast(msg: "Data Updated !!", ctx: context);
                  Navigator.pop(context);
                }
              }, child: Text("Submit"),),
            ],
          ),
          ),
      )
    );
  }
}