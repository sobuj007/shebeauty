import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:Ghore_Parlor/main.dart';

import 'package:Ghore_Parlor/utils/appApis.dart';
import 'package:Ghore_Parlor/utils/appStyle.dart';
import 'package:Ghore_Parlor/utils/custom%20widget/Temp.dart';
import 'package:Ghore_Parlor/utils/custom%20widget/sharedpref.dart';

class LoginContoller  {

  logins(username, password, context,isremind) async {
    try {
      AppStyle.showloader(context);

      var headersList = {'Content-Type': 'application/json'};
      var udata=AppAppis.login;
      print(udata);
      var url = Uri.parse(udata);

      var body = {"email": username, "password": password};

      var req = http.Request('POST', url);
      req.headers.addAll(headersList);
      req.body = json.encode(body);

      var res = await req.send();
      final resBody = await res.stream.bytesToString();

      if (res.statusCode >= 200 && res.statusCode < 300) {
            Map<String, dynamic> jsonResponse = jsonDecode(resBody);
          //  if(jsonResponse['profile']==null){
          //   Map<String,dynamic> d={"message":"no Data"};
          //   Mypref().saveprofile(d,jsonResponse['user'],jsonResponse['token']);
          //  }
      
        Mypref().saveprofile(jsonResponse['profile']?? {},jsonResponse['user'],jsonResponse['token'],isremind);
      tdata.setuser(jsonResponse['token']);
      // print("FILE");
      // print(jsonResponse['token']);
      // print(jsonResponse['profile']);
      // print(isremind.toString());
 
      // var data = await AllinfoController().addItem();print(data);
        if ( jsonResponse['user']['role'].toString()=='user') {
        
           Navigator.pop(context);
          Get.offNamed('/layout');
          AppStyle.snackbar("Success", "Welcome to SheBeauty");
          
        } else {
           Navigator.pop(context);
          AppStyle.snackbar("Error", "Plesase use Provider app to login");
          
        }

       
      } else {
        AppStyle.snackbar("Unauthorized", "Username and password doen't match");
        Navigator.pop(context);
      }
    } catch (e) {
      print(e);
    }
  }

  register(fullname, email, password, confpass, context) async {
    try {
      AppStyle.showloader(context);

      var headersList = {'Content-Type': 'application/json'};
      var url = Uri.parse(AppAppis.register);

      var body = {
        "name": fullname,
        "email": email,
        "password": password,
        "role": "user",
        "password_confirmation": confpass,
        "is_blocked": false
      };
      print(body);

      var req = http.Request('POST', url);
      req.headers.addAll(headersList);
      req.body = json.encode(body);
      var res = await req.send();
      final resBody = await res.stream.bytesToString();

      if (res.statusCode >= 200 && res.statusCode < 300) {
        //  UserDataModel.fromJson(json.decode(resBody) );
        
        Navigator.pop(context);
        AppStyle.snackbar("Success", " User register Successfull");
        Get.offNamed('/login');
      } else {
        print("lol" + res.reasonPhrase.toString());
        if(res.reasonPhrase=='Found'){
            AppStyle.snackbar("Account", "Email Alreday in Use");
        }else{
             AppStyle.snackbar("Error",  res.reasonPhrase.toString());
        }
      
        Navigator.pop(context);
      }
    } catch (e) {
      print(e);
    }
  }

 checkTokenValidity(tok) async {
  String token = tok.value; 

  final response = await http.get(
    Uri.parse(AppAppis.endpoint +'user'),
    headers: {
      'Authorization': 'Bearer $token',
    },
  );

  if (response.statusCode == 200) {
    // Token is valid
    var userData = jsonDecode(response.body);
    print("User Data: $userData");
    return true;
  } else if (response.statusCode == 401) {
    // Token is expired or invalid
    var errorMessage = jsonDecode(response.body);
    print("Error: ${errorMessage['error']}");
    if (errorMessage['error'] == 'Token has expired') {
      // Handle token expiration (e.g., refresh token or ask user to log in)
      print("Token has expired. Please log in again.");
      AppStyle.snackbar("Authentication", "Token has expired. Please log in again.");
      return false;
    } else {
      print("Authentication error. Token is invalid.");
       AppStyle.snackbar("Authentication", "Token is invalid. Please log in again.");
      return false;
    }
   
  }
}



}
