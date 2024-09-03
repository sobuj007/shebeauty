import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/custom widget/sharedpref.dart';

class Usercontoller extends GetxController{
var profile = {}.obs;
 var user ={}.obs;
  var token = ''.obs;
    late Map<String, dynamic> userdata;

@override
  void onInit() {
   getinfo();
    super.onInit();
  }


  getinfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userdata = (await Mypref().retrieveDataDynamically())!;
    // if (userdata) {
   profile.assignAll(userdata['profile']?? {});
    user.assignAll(userdata['user']);
    token.value=userdata['token'];
// setState(() {

// });

    // } else {
    //   print("No data found.");
   // }
  }

  getUser()=>user.value;
  getProfile()=>profile.value;
  getToken()=>token.value;
}