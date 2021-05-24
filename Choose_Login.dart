import 'package:family_tutor/Screens/Signup_Screen.dart';
import 'package:family_tutor/Screens/login_screen.dart';
import 'package:family_tutor/Utils/utilities.dart';
import 'package:family_tutor/widgets/background_container.dart';
import 'package:family_tutor/widgets/my_button.dart';
import 'package:family_tutor/widgets/outline_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChooseLogin extends StatefulWidget {
  @override
  _ChooseLoginState createState() => _ChooseLoginState();
}

class _ChooseLoginState extends State<ChooseLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackgroundContainer(),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.asset("images/bg1.jpg",
            fit: BoxFit.fill,),
          ),
          Container(
            color: Colors.black26,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).size.width/5.5,),
                Text(
                  "ENGAGING\nTUTORS \nAND \nSTUDENTS",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontWeight: FontWeight.w800,
                      fontFamily: "Sofia",
                      letterSpacing: 1.3),
                ),
                SizedBox(height: MediaQuery.of(context).size.width/2.5,),
                Text(
                  "Meet your tutors and students near your location.",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17.0,
                      fontWeight: FontWeight.w200,
                      fontFamily: "Sofia",
                      letterSpacing: 1.3),
                ),
              ],
            ),
          ),
         Column(
           mainAxisAlignment: MainAxisAlignment.end,
           crossAxisAlignment: CrossAxisAlignment.center,
           children: [
             MyFilledButton(
               txt: "Sign In",
               ontap: (){
                 Utils.push(context, LoginScreen());
             },),
             SizedBox(
               height: 20,
             ),
             MyOutlinedButton(
               ontap: (){
                 Utils.push(context, SignUpScreen());
               },
               txt: "Sign Up",
             ),
             SizedBox(
               height: 15,
             ),

           ],
         )
        ],
      ),
    );
  }
}
