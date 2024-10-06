import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../utils/appApis.dart';

class ProfileController extends GetxController {
  var userProfile = {}.obs; // Observable for storing user profile
  var isLoading = false.obs; // Loading state
  String? userId; // Store the user ID

  void setUserId(String id) {
    userId = id; // Set user ID once
  }

  Future<void> saveOrUpdateProfile({
    required String address,
    required String mobileNumber,
    required String? imagePath, // Image path can be null
    required String token,
    required  var userId
  }) async {
    if (userId == null) {
      print("User ID is not set. Please set it first.");
      return; // Exit if user ID is not set
    }

    isLoading.value = true; // Set loading to true

    try {
      // Check if the profile already exists
      final url = Uri.parse('https://softisan.xyz/api/usercommonprofile/$userId/show');
      final response = await http.get(url, headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      });

      if (response.statusCode == 200) {
        // Profile exists, call update API
         updateProfile(address, mobileNumber, imagePath, token);
      } else if (response.statusCode == 404) {
        // Profile does not exist, call store API (Optional)
        await storeProfile(address, mobileNumber, imagePath, token);
      } else {
        throw Exception('Failed to check profile');
      }
    } catch (error) {
      print("Error: $error");
    } finally {
      isLoading.value = false; // Set loading to false
    }
  }

  Future<void> storeProfile(String address, String mobileNumber, String? imagePath, String token) async {
    final url = Uri.parse(AppAppis.endpoint +'usercommonprofile/store');
    var request = http.MultipartRequest('POST', url);
    print(mobileNumber);

    request.headers['Authorization'] = 'Bearer $token';
    request.fields['address'] = address;
    request.fields['mobilenumber'] = mobileNumber.toString();

    if (imagePath != null) {
      request.files.add(await http.MultipartFile.fromPath('img', imagePath));
    }

    final response = await request.send();
    if (response.statusCode == 201) {
      print('Profile created successfully');
      // Optionally fetch the created profile data here
      final responseBody = await response.stream.bytesToString();
      userProfile.value = jsonDecode(responseBody);
    } else {
      print('Failed to create profile: ${response.statusCode}');
    }
  }

  Future<void> updateProfile(String address, String mobileNumber, String? imagePath, String token) async {
 


 var headersList = {
  'User-Agent': 'Thunder Client (https://www.thunderclient.com)',
  'Accept': 'application/json',
  // Remove 'Content-Type' since it will be set automatically
  'Authorization': 'Bearer $token'
};
var url = Uri.parse(AppAppis.endpoint +'usercommonprofile/$userId/update');

// Create a multipart request

  var request = http.MultipartRequest('PUT', url);
// Add headers to the request
request.headers.addAll(headersList);
  // Ensure that required fields are not empty
  if (address.isEmpty || mobileNumber.isEmpty) {
    print('Address and mobile number are required.');
    return; // Exit if required fields are empty
  }

  request.fields['address'] = address.toString();
  request.fields['mobilenumber'] = mobileNumber.toString();

  if (imagePath != null) {
    request.files.add(await http.MultipartFile.fromPath('img', imagePath));
  }

  final response = await request.send();
  
  if (response.statusCode == 200) {
    print('Profile updated successfully');
    final responseBody = await response.stream.bytesToString();
    userProfile.value = jsonDecode(responseBody);
  } else {
    final responseBody = await response.stream.bytesToString();
    print('Failed to update profile: ${response.statusCode}');
    print('Response: $responseBody'); // Print response body for debugging
  }
}

}
