import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Mypref {
  saveprofile(Map<String, dynamic> profile, Map<String, dynamic> user,
      String token,bool rememberme) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // Serialize the data to JSON strings
    String profileJson = jsonEncode(profile);
    String userJson = jsonEncode(user);
    await prefs.setString('profile', profileJson);
    await prefs.setString('user', userJson);
    await prefs.setString('token', token);
    await prefs.setString('rememberme', rememberme.toString());
    print("stored");
  }

  retrieveDataDynamically() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Retrieve the JSON strings
    String? profileJson = prefs.getString('profile');
    String? userJson = prefs.getString('user');
    String? token = prefs.getString('token');
    String? remMe = prefs.getString('rememberme');

    if (profileJson != null && userJson != null && token != null) {
      // Deserialize JSON strings to maps
      Map<String, dynamic> profileData = jsonDecode(profileJson);
      Map<String, dynamic> userData = jsonDecode(userJson);

      return {
        "profile": profileData,
        "user": userData,
        "token": token,
        "remeberme":remMe
      };
    } else {
      return null;
    }
  }
  void clearSharedPrefs() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.clear(); // This will clear all the stored data
  print('SharedPreferences cleared');
}
}
