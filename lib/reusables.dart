import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

TextField reusableTextField(String text,  bool isPasswordType,
    TextEditingController controller,int length) {
    return TextField(
    controller: controller,
    obscureText: isPasswordType,
    maxLength: length,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: Colors.black,
    style: TextStyle(color: Colors.black.withOpacity(0.9), fontSize:20),
    decoration: InputDecoration(
     // prefixIcon: Icon(
        //icon,
        //color: Colors.black,
     // ),
      labelText: text,
      labelStyle: TextStyle(color: Colors.black.withOpacity(0.9)),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Colors.white.withOpacity(0.3),

     // border: OutlineInputBorder(

         // borderRadius: BorderRadius.circular(15.0),
         // borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
    ),
    keyboardType: TextInputType.phone
  );

}

Container Button(BuildContext context, String title, Function onTap,{width=200}) {
  return Container(
    width: width,
    height: 50,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
    child: ElevatedButton(
      onPressed:onTap(),
      child: Text(
        title,
        style: const TextStyle(
            color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 16),
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.black26;
            }
            return Colors.lightBlue;
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),
    ),
  );
}

void maketoast({required String msg,required BuildContext ctx}) {
    var snackBar = SnackBar(
      content: Text(msg),
    );
    ScaffoldMessenger.of(ctx).showSnackBar(snackBar);
  }

void makeSuccesstoast({required String msg,required BuildContext ctx}) {
    var snackBar = SnackBar(
      backgroundColor: Colors.green[500],
      content: Text(msg,style: TextStyle(fontSize: 18),),
    );
    ScaffoldMessenger.of(ctx).showSnackBar(snackBar);
  }

Widget btncard(IconData icon, String title) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      color: Colors.blue[50],
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          
          child: Column(
            children: [
              Icon(
                icon,
                size: 40,
              ),
              Text(title)
            ],
          ),
        ),
      ),
    );
  }
  
// DropdownButtonFormField dropdown(BuildContext context, List<String> city, String initial_val, Function setState, String text ){
//   return DropdownButtonFormField(
//       value: initial_val,
//       items: city.map((e) => DropdownMenuItem(child: Text(e), value: e,)).toList(),
//       icon: Icon(Icons.keyboard_arrow_down_rounded),
//       decoration: InputDecoration(
//         labelText: text,
//         border: UnderlineInputBorder(),
//       ),
//       onChanged:(val){
//         initial_val= val as String;
//         /*setState(() {
//           initial_val= val as String;
//         });*/}
//   );
// }

// TextFormField reusableTextformField(String text, bool isPasswordType, TextInputType keyboard) {
//   return TextFormField(
//       //controller: controller,
//       obscureText: isPasswordType,
//       enableSuggestions: !isPasswordType,
//       autocorrect: !isPasswordType,
//       cursorColor: Colors.black,
//       style: TextStyle(color: Colors.black.withOpacity(0.9), fontSize: 20),
//       decoration: InputDecoration(
//         // prefixIcon: Icon(
//         //icon,
//         //color: Colors.black,
//         // ),
//         labelText: text,
//         labelStyle: TextStyle(color: Colors.black.withOpacity(0.9),),
//         filled: true,
//         floatingLabelBehavior: FloatingLabelBehavior.never,
//         fillColor: Colors.white.withOpacity(0.3),

//         // border: OutlineInputBorder(

//         // borderRadius: BorderRadius.circular(15.0),
//         // borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
//       ),
//       keyboardType: keyboard,
//   );
// }

//  showCupertinoDialog(context: context, builder:(BuildContext context) {
//                   SizedBox(
//                     height: 300,
//                     child: CupertinoDatePicker(
//                       initialDateTime: DateTime.now(),
//                       mode: CupertinoDatePickerMode.date,
//                       onDateTimeChanged: (value) {
//                         var sdate=value;
//                           tt1Controller.text="${sdate.day<10?"0${sdate.day}":sdate.day}-${sdate.month<10?"0${sdate.month}":sdate.month}-${sdate.year}";
               
//                     },),
//                   );
//                 },
//                 );  