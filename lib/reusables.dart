import 'package:Sujatha/phone_auth/signin.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

Widget singleBoxDesign(IconData icon, String title) {
  return Card(
    color: Colors.blue[200],
    elevation: 10,
    child: Padding(
      padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 40.0), // Adjust padding as needed
      child: Column(
        children: [
          Icon(icon, size: 40), // Adjust icon size as needed
          Text(title, textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold, // Set text to bold
            ),
          ),
        ],
      ),
    ),
  );
}
Widget createRowBox(IconData icon, String value, String description) {
  return Container(
    padding: EdgeInsets.all(16.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.0),
      color: Colors.blue[50],
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(icon, size: 40),
        Column(
          children: [
            Text(
              value,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              description,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ],
    ),
  );
}
Widget customRow(
    IconData icon,
    String title,
    String amount,
    var size,
    {Color? bgColor, VoidCallback? onTap}
    ) {
  bool isPressed = false;
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: EdgeInsets.only(
        top: 20,
        left: 25,
        right: 25,
      ),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.teal.withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 7,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 10,
          bottom: 10,
          right: 20,
          left: 20,
        ),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.blue[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Icon(icon),
              ),
            ),
            SizedBox(width: 15),
            Expanded(
              child: Container(
                width: (size.width - 90) * 0.7,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      amount,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}

Container Button(BuildContext context, String title, Function onTap,{width=200.0}) {
  return Container(
    width: width,
    height: 50.0,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
    child: ElevatedButton(
      onPressed:()=>onTap(),
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

// Function to show the logout confirmation dialog
void showLogoutConfirmationDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Logout Confirmation'),
        content: Text('Do you want to logout from Sujatha app?'),
        actions: <Widget>[
          TextButton(
            onPressed: ()=>logout(context),
            child: Text('Yes'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: Text('No'),
          ),
        ],
      );
    },
  );
}

void logout(context) async {
  await FirebaseAuth.instance.signOut();
  Navigator.popUntil(context, (route) => route.isFirst);
  Navigator.pushReplacement(
    context,
    CupertinoPageRoute(
      builder: (context) => Loginscreen(),
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