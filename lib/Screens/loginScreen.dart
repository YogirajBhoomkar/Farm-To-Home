import 'package:firebase_auth/firebase_auth.dart';
import 'package:fthve2/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fthve2/Services/AuthServices.dart';

class loginScreen extends StatefulWidget {
  @override
  static String id = "loginScreen";

  @override
  _loginScreenState createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {

  String mobileNumber;
  String code;
  String errorMessage = '';
  static bool sendCodeClicked = false;
  bool codeSent=false;
  static String buttonText = "Send Code";
  String phoneNo;
  String smsCode;
  static String verificationId;
  void initState(){
    super.initState();
   // AuthService().handleAuth();
  }

  Future<void> verifyPhone(phoneNo) async {

    final PhoneCodeAutoRetrievalTimeout autoRetrive = (String verId) {
      verificationId = verId;
    };
    final PhoneCodeSent smsCodeSent = (String verId, [int forceResendCode]) {
      verificationId = verId;
      setState(() {
        this.codeSent=true;
        buttonText = "Verify";
      });
    };
    final PhoneVerificationCompleted verificationSuccess = (
        AuthCredential authResult) {
    //  AuthService().signIn(authResult);
    };

    final PhoneVerificationFailed verificationFailed = (
        AuthException authException) {
      print('${authException.message}');
    };

    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: this.phoneNo,
        timeout: const Duration(seconds: 30),
        verificationCompleted: verificationSuccess,
        verificationFailed: verificationFailed,
        codeSent: smsCodeSent,
        codeAutoRetrievalTimeout: autoRetrive);


  }



  Widget build(BuildContext context) {
    double defaultScreenWidth = 414.0;
    double defaultScreenHeight = 896.0;
    ScreenUtil.init(context,
        width: defaultScreenWidth,
        height: defaultScreenHeight,
        allowFontScaling: false);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 20.0),
                    padding: EdgeInsets.all(
                      ScreenUtil().setWidth(10),
                    ),
                    width: 375.w,
                    height: 350.h,
                    child: Image.asset(
                      "assets/loginFarmer.png",
                      height: 300.0,
                      width: 300.0,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: ScreenUtil().setWidth(30),
                    vertical: ScreenUtil().setHeight(20),
                  ),
                  child: Text(
                    "Nice to see you !",
                    style: loginWelcomeText,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: ScreenUtil().setWidth(10),
                    vertical: ScreenUtil().setHeight(10),
                  ),
                  width: 320.w,
                  height: 100.h,
                  child: Text(
                    "Join us and help farmers get good price for their produce.",
                    style: loginWelcomeText.copyWith(
                        fontSize: ScreenUtil().setSp(20),
                        fontWeight: FontWeight.w100,
                        fontFamily: 'Raleway'),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: ScreenUtil().setWidth(10),
                    vertical: ScreenUtil().setHeight(10),
                  ),
                  width: 350.w,
                  height: 70.h,
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        this.phoneNo = "+91" + value;
                      });

                    },
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.numberWithOptions(),
                    style: textFieldTextStyle,
                    decoration: textFieldInputDecoration,
                  ),
                ),
                codeSent ? Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: ScreenUtil().setWidth(10),
                    vertical: ScreenUtil().setHeight(20),
                  ),
                  width: 350.w,
                  height: 100.h,
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        this.smsCode = value;
                      });

                    },
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.numberWithOptions(),
                    style: textFieldTextStyle,
                    decoration: textField2InputDecoration,
                  ),
                ):Container(color:Colors.yellow),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: ScreenUtil().setWidth(10),
                    vertical: ScreenUtil().setHeight(10),
                  ),
                  width: ScreenUtil().setWidth(250),
                  height: ScreenUtil().setHeight(80),
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        ScreenUtil().setSp(12),
                      ),
                    ),
                    color: Color(0xFF0CBA77),
                    onPressed: () {
                    //  codeSent ? AuthService().signInWithOTP(smsCode, verificationId):verifyPhone(phoneNo);
                    },
                    child: Text(
                      buttonText,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Raleway',
                        fontSize: ScreenUtil().setSp(17),
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text(
            "Invalid Mobile Number",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Raleway',
              fontWeight: FontWeight.w400,
              fontSize: ScreenUtil().setSp(25),
              color: Color(0xFF0CBA77),
            ),
          ),
          content: new Text(
            "Please Enter a 10 digit valid number",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Raleway',
              fontWeight: FontWeight.w100,
              fontSize: ScreenUtil().setSp(17),
              color: Colors.redAccent,
            ),
          ),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            Center(
              child: FlatButton(
                color: Colors.redAccent,
                child: Text(
                  "Okay",
                  style: TextStyle(
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w100,
                    fontSize: ScreenUtil().setSp(20),
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
