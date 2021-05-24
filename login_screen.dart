import 'package:family_tutor/widgets/my_button.dart';
import 'package:family_tutor/widgets/my_text_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyTextField(controller: _emailController,label: "Email",),
                SizedBox(
                  height: 15,
                ),
                MyTextField(controller: _passwordController,label: "Password",)

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
