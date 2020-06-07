import 'package:fthve2/Screens/loginScreen.dart';
import 'package:fthve2/Screens/mapScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fthve2/Screens/splashScreen.dart';
import 'package:fthve2/Services/AuthServices.dart';
import 'package:fthve2/Services/userData.dart';

class registerScreen extends StatefulWidget {
  static String id = "registerScreen";

  @override
  _registerScreenState createState() => _registerScreenState();
}

class _registerScreenState extends State<registerScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;

  String imageUrl = "images/registerbackground.png";
  String errorMessage = '';
  static bool sendCodeClicked = false;
   bool codeSent=false;
  static String buttonText = "Send Code";
  String phoneNo;
  String smsCode;
  String verificationId;

  bool nowcallCurrentUser=false;
  
void initState(){
  super.initState();
  AuthService().handleAuth();
}



  Future<void> verifyPhone(phoneNo) async {

    final PhoneCodeAutoRetrievalTimeout autoRetrive = (String verId) {
      this.verificationId = verId;
    };
    final PhoneCodeSent smsCodeSent = (String verId, [int forceResendCode]) {
      this.verificationId = verId;
      setState(() {
        this.codeSent=true;
        buttonText = "Verify";
      });
    };
    final PhoneVerificationCompleted verificationSuccess = (
        AuthCredential authResult) {
      AuthService().signIn(authResult);



    };

    final PhoneVerificationFailed verificationFailed = (
        AuthException authException) {
      print('${authException.message}');
    };

    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: this.phoneNo,
        timeout: const Duration(seconds: 60),
        verificationCompleted: verificationSuccess,
        verificationFailed: verificationFailed,
        codeSent: smsCodeSent,
        codeAutoRetrievalTimeout: autoRetrive);





  }


  @override
  Widget build(BuildContext context) {

    double defaultScreenWidth = 414.0;
    double defaultScreenHeight = 896.0;
    if (MediaQuery
        .of(context)
        .size
        .width > 750) {
      imageUrl = "assets/ipadregisterbackground.png";
    }
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
          body: Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/registerbackground.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(
                      top: ScreenUtil().setHeight(335),
                    ),
                    width: 300.w,
                    height: 70.h,
                    child: Text(
                      "Buying directly from farmers is your greatest contribution",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w100,
                        fontSize: ScreenUtil().setSp(20),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: ScreenUtil().setWidth(20),
                      right: ScreenUtil().setWidth(20),
                      bottom: ScreenUtil().setHeight(30),
                    ),
                    padding: EdgeInsets.only(
                      bottom: ScreenUtil().setHeight(20),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        ScreenUtil().setSp(10),
                      ),
                    ),
                    width: 400.w,
                    height: 380.h,
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(
                            top: ScreenUtil().setHeight(30),
                          ),
                          child: Text(
                            "Let's Connect",
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                              fontSize: ScreenUtil().setSp(25),
                              color: Color(0xFF0CBA77),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: ScreenUtil().setHeight(10),
                            horizontal: ScreenUtil().setWidth(20),
                          ),
                          child: TextField(
                            onChanged: (value) {
                              setState(() {
                                this.phoneNo = "+91" + value;
                              });

                            },
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'OpenSans',
                              fontWeight: FontWeight.w100,
                              fontSize: ScreenUtil().setSp(17),
                              color: Color(0xFF18BA77),
                            ),
                            decoration: InputDecoration(
                              prefixText: "+91",
                              prefixStyle: TextStyle(
                                fontFamily: 'OpenSans',
                                fontWeight: FontWeight.w100,
                                fontSize: ScreenUtil().setSp(17),
                                color: Color(0xFF18BA77),
                              ),
                              hintText: "Tell us your mobile Number",
                              hintStyle: TextStyle(
                                  fontFamily: 'OpenSans',
                                  fontSize: ScreenUtil().setSp(17),
                                  color: Colors.grey),
                            ),
                          ),
                        ),
                       codeSent ? Container(
                          padding: EdgeInsets.symmetric(
                            vertical: ScreenUtil().setHeight(10),
                            horizontal: ScreenUtil().setWidth(20),
                          ),
                          child: TextField(
                            onChanged: (value) {
                              setState(() {
                                this.smsCode = value;
                              });

                            },
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'OpenSans',
                              fontWeight: FontWeight.w100,
                              fontSize: ScreenUtil().setSp(17),
                              color: Color(0xFF18BA77),
                            ),
                            decoration: InputDecoration(
                              hintText: "Tell us the Code we sent you",
                              hintStyle: TextStyle(
                                  fontFamily: 'OpenSans',
                                  fontSize: ScreenUtil().setSp(17),
                                  color: Colors.grey),
                            ),
                          ),
                        ):Container(),
                        Container(
                          margin: EdgeInsets.only(
                            top: ScreenUtil().setHeight(20),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: ScreenUtil().setWidth(10),
                            vertical: ScreenUtil().setHeight(10),
                          ),
                          width: 250.w,
                          height: 70.h,
                          child: FlatButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                ScreenUtil().setSp(30),
                              ),
                            ),
                            color: Color(0xFF18BA77),
                            onPressed: () {


                              if(codeSent==true){
                                AuthService().signInWithOTP(
                                    this.smsCode, this.verificationId);
                                setState(() {
                                  nowcallCurrentUser=true;
                                });
                              }
                              else{
                                verifyPhone(phoneNo);
                              }
                              setState(() {
                                if(nowcallCurrentUser==true){
                                 currentUserCheck();
                                }
                              });

                            },
                            child: Text(
                              buttonText,
                              style: TextStyle(
                                fontFamily: "OpenSans",
                                fontWeight: FontWeight.w100,
                                color: Colors.white,
                                fontSize: ScreenUtil().setSp(17),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: ScreenUtil().setWidth(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Already have account, ",
                                style: TextStyle(
                                    fontFamily: "Raleway",
                                    fontWeight: FontWeight.w400,
                                    fontSize: ScreenUtil().setSp(16),
                                    color: Colors.grey),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, loginScreen.id);
                                },
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                      fontFamily: "Roboto",
                                      fontWeight: FontWeight.w400,
                                      fontSize: ScreenUtil().setSp(16),
                                      color: Color(0xFF18BA77)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

//User Authentication
    currentUserCheck()async{
    FirebaseAuth auth = FirebaseAuth.instance;
    final FirebaseUser user = await auth.currentUser();

    if(user!=null){
      print("yessssssssssssssssssssssssssssssssssssssssssssssssss");
    Navigator.pushNamed(context, mapScreen.id);
    }
    else{
    print("spalsh");
   Navigator.pushNamed(context, splashScreen.id);
    }
    }
}
