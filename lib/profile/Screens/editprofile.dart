import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shebeauty/auth/Controllers/userContoller.dart';
import 'package:shebeauty/main.dart';
import 'package:shebeauty/utils/appStyle.dart';

import '../../utils/custom widget/CustomAppbar.dart';


class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final Usercontoller ucon=Get.put(Usercontoller());
  File? _imageFile;
  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _requestPermissions();
  }

  // Pick image from gallery
  Future<void> pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    } else {
      print('No image selected.');
    }
  }
var token = tdata.getuser(); 
  // Upload image to Laravel API
 // Upload image to Laravel API
Future<void> uploadImage() async {
    // Replace this with token retrieval logic
  var  userid=ucon.user.value['id'].toString();
  if (_imageFile == null) {
    print('No image selected.');
    return;
  }

  var url = Uri.parse('https://softisan.xyz/api/usercommonprofile/$userid/update');
  var request = http.MultipartRequest('POST', url);

  // Add authorization token
  request.headers['Authorization'] = 'Bearer $token';

  // Add the image file
  var imageFile = await http.MultipartFile.fromPath('img', _imageFile!.path);
  request.files.add(imageFile);

  // Add other form fields
  request.fields['user_id'] = userid;  // Replace this with actual user ID
  request.fields['address'] = _addressController.text;
  request.fields['mobilenumber'] = _mobileController.text;

  // Send the request
  var response = await request.send();
  var responseBody = await response.stream.bytesToString();

  // Check for 201 (created) or 200 (OK)
  if (response.statusCode == 200 || response.statusCode == 201) {
    print('Upload success: $responseBody');
    AppStyle.snackbar("Profiile Updated", "Profile update Succesfully completed");
    _addressController.clear();
    _mobileController.clear();
    _imageFile=null;
  } else {
    print('Upload failed: ${response.statusCode}');
    print('Response: $responseBody');
    var data=jsonDecode(responseBody);
   SharedPreferences prefs = await SharedPreferences.getInstance();
   prefs.setString('profile', data);
     AppStyle.snackbar("Sorry Somthing worng", "Somthing worng profile don't update");
  }
}
  Future<void> _requestPermissions() async {
    final cameraStatus = await Permission.camera.request();
    final storageStatus = await Permission.storage.request();

    if (cameraStatus.isGranted && storageStatus.isGranted) {
      print('Permissions granted');
    } else {
      print('Permissions denied');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppbar(title: "Edit"),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: _imageFile == null
                      ? Text('No image selected.')
                      : Image.file(_imageFile!, height: 150),
                ),
                SizedBox(height: 8.0),
                ElevatedButton(
                  onPressed: pickImage,
                  child: Text('Pick Image'),
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: _addressController,
                  decoration: InputDecoration(labelText: 'Address'),
                ),
                SizedBox(height: 8.0),
                TextField(
                  controller: _mobileController,
                  decoration: InputDecoration(labelText: 'Mobile Number'),
                  keyboardType: TextInputType.phone,
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: uploadImage,
                  child: Text('Upload'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
