import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:Ghore_Parlor/auth/Controllers/userContoller.dart';
import 'package:Ghore_Parlor/main.dart';

import '../utils/appApis.dart';
import 'model/HistoryModel.dart';

class HistoryController extends GetxController {
  var historyModel = HistoryModel().obs; // Observable history model
  var isLoading = true.obs; // Observable to show loading state
  var hasError = false.obs; // Observable to show error state


@override
  void onInit() {
    super.onInit();

  }


  // Fetch history data from the API
fetchHistory(id) async {
   
    var token= tdata.getuser();
  
    print(id);
    try {
      isLoading(true);
      var headersList = {
        
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      };
      var url = Uri.parse(AppAppis.endpoint +'userorders/get');
      
      var body = {
        "user_id": id
      };
      
      var req = http.Request('POST', url);
      req.headers.addAll(headersList);
      req.body = json.encode(body);

      var res = await req.send();
      final resBody = await res.stream.bytesToString();

      if (res.statusCode >= 200 && res.statusCode < 300) {
        var jsonResponse = json.decode(resBody);
        historyModel(HistoryModel.fromJson(jsonResponse)); // Set the model with response data
      } else {
        hasError(true);
        print('Error: ${res.reasonPhrase}');
      }
    } catch (e) {
      hasError(true);
      print("Error: $e");
    } finally {
      isLoading(false); // Turn off loading indicator
    }
  }
}