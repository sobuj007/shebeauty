import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../main.dart';
import '../../utils/appApis.dart';
import '../Model/agentProfileModel.dart';

class AgentProfileController extends GetxController {
  var isLoading = false.obs; // Loading state
  var agentProfile =
      AgentprofileModel().obs; // Observable to hold the model data

  // Fetch data from API
  Future<void> fetchAgentProfileData(data) async {
    try {
      isLoading(true); // Set loading to true when request starts
      var token = tdata.getuser();
      var headersList = {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      };

      // API URL
      var url = Uri.parse(AppAppis.endpoint + 'storeprofiles/$data/getagent');

      // Create request
      var req = http.Request('GET', url);
      req.headers.addAll(headersList);

      // Send the request
      var res = await req.send();
      final resBody = await res.stream.bytesToString();
      var jsonData = jsonDecode(resBody);
      // Handle response
      if (res.statusCode >= 200 && res.statusCode < 300) {
        var jsonData = jsonDecode(resBody); // Decode the JSON
        agentProfile.value =
            AgentprofileModel.fromJson(jsonData); // Parse data into model
        print("objectagentprofile");
        print(agentProfile.value);
      } else {
        // Error handling
        Get.snackbar("Error", res.reasonPhrase ?? "Failed to fetch data");
      }
    } catch (e) {
      // Handle exception
      Get.snackbar("Error", "An error occurred: $e");
    } finally {
      isLoading(false); // Set loading to false when request ends
    }
  }

  List<Profiles>? get profilesdata => agentProfile.value.profiles;
  List<Exparts>? get exparts => agentProfile.value.exparts;
  List<Certificate>? get certificate => agentProfile.value.certificate;
  List<Products>? get productrecomandation => agentProfile.value.products;
}
