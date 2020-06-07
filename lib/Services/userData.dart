import 'package:flutter/material.dart';

class UserData{
  String name="";
  String email="";
  String mobile="";
  String location="";
  String societyName="";
  String societyLocation="";
  String societyHeadName="";
  String pincode="";

  void Setter(String value, String of){
    if(of=="name"){
      name=of;
    }
    if(of=="email"){
      email=of;
    }
    if(of=="mobile"){
      mobile=of;
    }
    if(of=="location"){
      location=of;
    }
    if(of=="societyName"){
      societyHeadName=of;
    }
    if(of=="societyLocation"){
      societyLocation=of;
    }
    if(of=="societyHeaName"){
      societyHeadName=of;
    }
    if(of=="pincode"){
      pincode=of;
    }
  }
  String Getter(String of){
    if(of=="name"){
     return name;
    }
    if(of=="email"){
      return email;
    }
    if(of=="mobile"){
      return mobile;
    }
    if(of=="location"){
      return location;
    }
    if(of=="societyName"){
      return societyHeadName;
    }
    if(of=="societyLocation"){
      return societyLocation;
    }
    if(of=="societyHeaName"){
      return societyHeadName;
    }
    if(of=="pincode"){
      return pincode;
    }
  }
}
