import 'package:flutter/material.dart';

class EmailVerification extends StatefulWidget {
  bool signupFlag;
  EmailVerification(this.signupFlag);
  @override
  _EmailVerificationState createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailVerification> {
  var _emailController = TextEditingController();
  var _otpController = TextEditingController();
  bool _isInternetConnection = true;
  bool _inProgress = false;
  bool _emailsent=false;

  var _credentialsError = '';
  var _invalidEmail = false;
  var _signUpError = false;
  var _errorTxt = "";

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Container(
                height: _height,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            "images/loginBackground.jpeg"),
                        fit: BoxFit.cover)),
              ),
              Container(
                height: _height,
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.black12.withOpacity(0.2)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 230.0),
                child: Container(
                  height: _height,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0)),
                      color: Color(0xFF1E2026)),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 30.0,
                      ),
                      Text(
                        "Email Verification",
                        style: TextStyle(
                            fontFamily: "Sofia",
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 28.0),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(widget.signupFlag?"Sign Up":"For Password Reset",
                            style: TextStyle(
                                fontFamily: "Sofia",
                                color: Color(0xFFFA709A),
                                fontWeight: FontWeight.w300,
                                fontSize: 15.0)),
                      ),
                    _emailsent?_confirmVerificationContainer():_verificationContainer(),
                      SizedBox(
                        height: 18.0,
                      ),
                      InkWell(
                        onTap: (){
                          //TODO:
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Have an account?",
                              style: TextStyle(
                                  fontFamily: "Sofia",
                                  color: Colors.white,
                                  fontWeight: FontWeight.w200,
                                  fontSize: 15.0),
                            ),
                            Text(" Signin",
                                style: TextStyle(
                                    fontFamily: "Sofia",
                                    color: Color(0xFFFA709A),
                                    fontWeight: FontWeight.w300,
                                    fontSize: 15.0))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              _inProgress ?
              IgnorePointer(
                ignoring: _inProgress,
                child: AnimatedOpacity(
                  opacity: _inProgress ? 1.0 : 0.0,
                  duration: Duration(milliseconds: 3500),
                  child: Container(
                    height: _height,
                    width: double.infinity,
                    child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            CircularProgressIndicator(
                              backgroundColor: Colors.yellow),

                          ],
                        )
                    ),
                  ),
                ),
              )
                  : Text ('')
            ],
          ),
        ),
        bottomSheet: !_isInternetConnection
            ? InkWell(
          onTap: () {
            setState(() {
              _isInternetConnection = true;
            });
            // _signUp();
          },
          child: Container(
            height: 60.0,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  Color(0xFFFEE140),
                  Color(0xFFFA709A),
                ],
              ),
            ),
            child: Center(
              child: Text(
                'No Internet Connection',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 19.0,
                  letterSpacing: 1.2,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Poppins",
                ),
              ),
            ),
          ),
        )
            : _signUpError
            ? InkWell(
          onTap: () {
            setState(() {
              _signUpError =  false;
            });
          },
          child: Container(
            height: 60.0,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  Color(0xFFFEE140),
                  Color(0xFFFA709A),
                ],
              ),
            ),
            child: Center(
              child: Text(
                _errorTxt,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 19.0,
                  letterSpacing: 1.2,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Poppins",
                ),
              ),
            ),
          ),
        )
            : Text('')
    );
  }
 Widget  _verificationContainer(){
    return Container(
     child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 25.0, right: 25.0, top: 15.0),
            child: Container(
              height: 53.5,
              decoration: BoxDecoration(
                color: Color(0xFF23252E),
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                border: Border.all(
                  color: Colors.black12,
                  width: 0.15,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 12.0, right: 12.0, top: 5.0),
                child: Theme(
                  data: ThemeData(hintColor: Colors.transparent),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: TextFormField(
                      controller: _emailController,
                      style: new TextStyle(color: Colors.white),
                      textAlign: TextAlign.start,
                      keyboardType: TextInputType.emailAddress,
                      autocorrect: false,
                      autofocus: false,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(0.0),
                          filled: true,
                          fillColor: Colors.transparent,
                          labelText: 'Email',
                          errorText: _invalidEmail ? _credentialsError : '',
                          hintStyle: TextStyle(color: Colors.white),
                          labelStyle: TextStyle(
                            color: Colors.white70,
                          )),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 20.0, right: 20.0, top: 64.0),
            child: InkWell(
              onTap: _verifyEmail,
              child: Container(
                height: 52.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(80.0),
                  gradient: LinearGradient(colors: [
                    Color(0xFFFEE140),
                    Color(0xFFFA709A),
                  ]),
                ),
                child: Center(
                    child: Text(
                      "Send Verification Email",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17.0,
                          fontWeight: FontWeight.w700,
                          fontFamily: "Sofia",
                          letterSpacing: 0.9),
                    )),
              ),
            ),
          ),
        ],
      )
    );
  }
  Widget _confirmVerificationContainer(){
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 25.0, right: 25.0, top: 15.0),
            child: Container(
              height: 53.5,
              decoration: BoxDecoration(
                color: Color(0xFF23252E),
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                border: Border.all(
                  color: Colors.black12,
                  width: 0.15,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 12.0, right: 12.0, top: 5.0),
                child: Theme(
                  data: ThemeData(hintColor: Colors.transparent),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: TextFormField(
                      controller: _otpController,
                      style: new TextStyle(color: Colors.white),
                      textAlign: TextAlign.start,
                      keyboardType: TextInputType.number,
                      autocorrect: false,
                      autofocus: false,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(0.0),
                          filled: true,
                          fillColor: Colors.transparent,
                          labelText: 'OTP',
                          errorText: _invalidEmail ? _credentialsError : '',
                          hintStyle: TextStyle(color: Colors.white),
                          labelStyle: TextStyle(
                            color: Colors.white70,
                          )),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 20.0, right: 20.0, top: 64.0),
            child: InkWell(
              onTap: _verifyOTP,
              child: Container(
                height: 52.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(80.0),
                  gradient: LinearGradient(colors: [
                    Color(0xFFFEE140),
                    Color(0xFFFA709A),
                  ]),
                ),
                child: Center(
                    child: Text(
                      "Confim",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17.0,
                          fontWeight: FontWeight.w700,
                          fontFamily: "Sofia",
                          letterSpacing: 0.9),
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
  _verifyOTP(){
    //todo code here for otp verification
  }
  _verifyEmail()async{
  //TODO:// verify your email here
  }
  @override
  void dispose() {
    _emailController.clear();
    _otpController.clear();
    // TODO: implement dispose
    super.dispose();
  }
}
