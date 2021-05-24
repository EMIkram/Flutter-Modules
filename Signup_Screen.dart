import 'package:family_tutor/widgets/my_button.dart';
import 'package:family_tutor/widgets/my_text_field.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.black,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.asset("images/bg1.jpg",
              fit: BoxFit.fill,),
          ),

          Container(
            color: Colors.black87,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          ///TextFields
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyTextField(controller: _emailController,label: "Full Name",),
                SizedBox(
                  height: 15,
                ),
                MyTextField(controller: _emailController,label: "Email",),
                SizedBox(
                  height: 15,
                ),
                MyTextField(controller: _emailController,label: "Phone",),
                SizedBox(
                  height: 15,
                ),
                MyTextField(controller: _passwordController,label: "Password",),
                SizedBox(
                  height: 15,
                ),
                MyTextField(controller: _passwordController,label: "Confirm Password",),
              ],
            ),
          ),
          ///Button
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MyFilledButton(
                txt: "Register",
                ontap: (){
                  // Utils.push(context, LoginScreen());
                },),
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
