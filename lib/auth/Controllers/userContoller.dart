import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/custom widget/sharedpref.dart';

class Usercontoller extends GetxController{
var profile = {}.obs;
 var user ={}.obs;
  var token = ''.obs;
    var userdata={}.obs;

@override
  void onInit() {
   getinfo();
    super.onInit();
  }


 getinfo() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  // Retrieve data dynamically and check if it's null
  var retrievedData = await Mypref().retrieveDataDynamically();
  
  // Ensure userdata is not null before assigning
  if (retrievedData != null) {
    userdata.value = retrievedData;

    // Safely access profile and user properties
    profile.assignAll(userdata['profile'] ?? {});
    user.assignAll(userdata['user'] ?? {});
    token.value = userdata['token'] ?? '';
  } else {
    // Handle the case when userdata is null
    print("No data found.");
  }
}

  getUser()=>user.value;
  getProfile()=>profile.value;
  getToken()=>token.value;
}