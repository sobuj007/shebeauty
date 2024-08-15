import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shebeauty/auth/Model/userModel.dart';
import 'package:shebeauty/category/Controllers/getAllinfocontoller.dart';
import 'package:shebeauty/main.dart';
import 'package:shebeauty/utils/appApis.dart';
import 'package:shebeauty/utils/appStyle.dart';

class LoginContoller {
 
  logins(username, password, context) async {
    try {
      AppStyle.showloader(context);

      var headersList = {'Content-Type': 'application/json'};
      var url = Uri.parse(AppAppis.login);

      var body = {"email": username, "password": password};

      var req = http.Request('POST', url);
      req.headers.addAll(headersList);
      req.body = json.encode(body);

      var res = await req.send();
      final resBody = await res.stream.bytesToString();

      if (res.statusCode >= 200 && res.statusCode < 300) {
            Map<String, dynamic> jsonResponse = jsonDecode(resBody);

        // Update the observable with the parsed data
        UserDataModel.fromJson(jsonResponse);
        tdata.setuser(jsonResponse['user']);
   
        var data = await AllinfoController().addItem();
        if (data) {
          Navigator.pop(context);
          Get.offNamed('/layout');
          AppStyle.snackbar("Success", "Welcome to SheBeauty");
        } else {
          AppStyle.snackbar("Error", "Somthing Wrong! Data not Found");
          
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
        Navigator.pop(context);
      }
    } catch (e) {
      print(e);
    }
  }
}
