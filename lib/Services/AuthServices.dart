import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fthve2/Screens/homeScreen.dart';
import 'package:fthve2/Screens/loginScreen.dart';
import 'package:fthve2/Screens/mapScreen.dart';
import 'package:fthve2/Screens/register.dart' as register;
import 'package:fthve2/Screens/splashScreen.dart';


class AuthService{

  handleAuth(){

//    return StreamBuilder<FirebaseUser>(
//      stream: FirebaseAuth.instance.onAuthStateChanged,
//      builder: (BuildContext context, snapshot) {
//        if (snapshot.hasData) {
//          print("hii");
//          return mapScreen();
//        } else {
//          print("hello");
//          return loginScreen();
//        }
//      },
//    );


    return StreamBuilder(stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (BuildContext context, snapshot) {
        if(snapshot.hasData){
          print("going to mapScreen");
          return mapScreen();

        }

        else{
          print("going to loginScreen");
          return loginScreen();

        }
      },
    );
  }



  //Signout
  signOut(){
    FirebaseAuth.instance.signOut();
  }

  //SignIn
  signIn(AuthCredential authcreds){
    FirebaseAuth.instance.signInWithCredential(authcreds);
  }

  signInWithOTP(smsCode,verId){
    AuthCredential authCreds = PhoneAuthProvider.getCredential(verificationId: verId, smsCode: smsCode);
    signIn(authCreds);
  }
}
class callScreens extends StatefulWidget {
  @override
  _callScreensState createState() => _callScreensState();
}

class _callScreensState extends State<callScreens> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
