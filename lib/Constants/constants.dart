import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

final loginWelcomeText = TextStyle(
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w500,
  fontSize: ScreenUtil().setSp(30.0),
  color: Color(0xFF0CBA77),
);

final textFieldTextStyle = TextStyle(
  fontSize: ScreenUtil().setSp(20),
  fontFamily: 'OpenSans',
  fontWeight: FontWeight.w400,
  color: Color(0xFF0CBA77),
);
final textFieldInputDecoration = InputDecoration(
  enabledBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.cyan),
  ),
  focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.cyan),
  ),
  prefixText: "+91",
  prefixStyle: TextStyle(
    fontSize: ScreenUtil().setSp(20),
    fontFamily: 'OpenSans',
    fontWeight: FontWeight.w400,
    color: Color(0xFF0CBA77),
  ),
  hintText: "Tell us your mobile number",
  hintStyle: TextStyle(
    fontFamily: 'Raleway',
    fontWeight: FontWeight.w100,
    fontSize: ScreenUtil().setSp(20),
  ),
);

final textField2InputDecoration = InputDecoration(
  enabledBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.cyan),
  ),
  focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.cyan),
  ),
  prefixStyle: TextStyle(
    fontSize: ScreenUtil().setSp(20),
    fontFamily: 'OpenSans',
    fontWeight: FontWeight.w400,
    color: Color(0xFF0CBA77),
  ),
  hintText: "Tell us the code we sent you",
  hintStyle: TextStyle(
    fontFamily: 'Raleway',
    fontWeight: FontWeight.w100,
    fontSize: ScreenUtil().setSp(20),
  ),
);
