import 'package:Ghore_Parlor/auth/Controllers/userContoller.dart';
import 'package:Ghore_Parlor/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'dart:convert';

import '../../utils/appApis.dart';
import '../../utils/appColors.dart';
import '../../utils/appFonts.dart';
import '../../utils/appStyle.dart';

class Editprofile extends StatefulWidget {
  final mobile;
  const Editprofile({this.mobile, super.key});
  @override
  _EditprofileState createState() => _EditprofileState();
}

class _EditprofileState extends State<Editprofile> {
  TextEditingController _addressController = TextEditingController();
  TextEditingController _mobileController = TextEditingController();
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();
  String? _profileId;
  bool _isLoading = false;
  var token = tdata.getuser();
  var ucon = Get.put(Usercontoller());
  var proimg;
  var selectedgender = 'Female';
  @override
  void initState() {
    super.initState();
    print(widget.mobile);
    if (widget.mobile != null) {
      _fetchUserProfile();
    }
  }

  Future<void> _fetchUserProfile() async {
    setState(() {
      _isLoading = true;
    });
    var userid = ucon.user.value['id'].toString();
    final url = Uri.parse(AppAppis.endpoint + 'usercommonprofile/$userid/show');
    final response = await http.get(url, headers: {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
    });

    if (response.statusCode == 200) {
      // Profile exists, call update API
    }

    // Replace with your API endpoint
    // final url = Uri.parse('https://softisan.xyz/api/usercommonprofile');

    // Replace with your authorization token
    // var headers = {
    //   'Authorization': 'Bearer $token',
    //   'Accept': 'application/json'
    // };

    // final response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
      setState(() {
        _addressController.text = data['address'] ?? '';
        _mobileController.text = data['mobilenumber'] ?? '';
        selectedgender = data['gender'] ?? '';
        proimg = data['img'] ?? '';

        _profileId =
            data['id'].toString(); // Save profile id to check if it exists
        _isLoading = false;
      });

      print(_profileId);
    } else {
      setState(() {
        _isLoading = false;
      });
      print('Failed to load profile');
    }
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  Future<void> _saveProfile() async {
    setState(() {
      _isLoading = true;
    });

    final url = _profileId != null
        ? Uri.parse(AppAppis.endpoint + 'usercommonprofile/$_profileId/update')
        : Uri.parse(AppAppis.endpoint + 'usercommonprofile/store');

    var request = http.MultipartRequest('POST', url);

    request.headers['Authorization'] = 'Bearer $token';
    request.fields['address'] = _addressController.text;
    request.fields['mobilenumber'] = _mobileController.text;
    request.fields['gender'] = selectedgender.toString();
    // print(_addressController.text);
    // print(_mobileController.text);
    // print(_imageFile!.path.toString());
    if (_imageFile != null) {
      request.files
          .add(await http.MultipartFile.fromPath('img', _imageFile!.path));
    }

    final response = await request.send();
    if (response.statusCode == 200 || response.statusCode == 201) {
      print('Profile saved successfully');
      final responseBody = await response.stream.bytesToString();
      print(responseBody);
      var data = jsonDecode(responseBody);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('profile', responseBody);
      AppStyle.snackbar(
          "Profiile Updated", "Profile update Succesfully completed");
      Get.offAndToNamed('/layout');
    } else {
      print('Failed to save profile: ${response.statusCode}');
      AppStyle.snackbar(
          "Sorry Somthing worng", "Somthing worng profile don't update");
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Profile',
          style: AppFonts.fontH4semi(AppColors.themeWhite),
        ),
        backgroundColor: AppColors.themeColer,
        iconTheme: IconThemeData(
            color:
                AppColors.themeWhite // Change the color of the back arrow here
            ),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Basic Info :',
                      style: AppFonts.fontH5semi(AppColors.themeBlack),
                    ),
                    Container(
                      height: 12.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: .03.h, color: AppColors.themeborder),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 1.5.h,vertical: 1.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Fullname : \t ${ucon.user['name'].toString().toUpperCase()}',
                              style:
                                  AppFonts.fontH5normal(AppColors.themeBlack),
                            ),
                            Text(
                              'Email : \t ${ucon.user['email'].toString()}',
                              style:
                                  AppFonts.fontH6regular(AppColors.themeBlack),
                            ),
                            Text(
                              'Subcription : \t ${ucon.user['subscription'].toString()}',
                              style:
                                  AppFonts.fontH6regular(AppColors.themeBlack),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 2.h,),
                    TextField(
                      controller: _addressController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 1.h),
                        labelText: 'Address',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              width: .4.h, color: AppColors.themeborder),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              width: .2.h, color: AppColors.themeColer),
                        ),
                      ),
                    ),
                          SizedBox(height: 1.5.h,),
                    TextField(
                      controller: _mobileController,
                      maxLength: 11,
                      decoration: InputDecoration(
                        labelText: 'Mobile Number',
                        contentPadding: EdgeInsets.symmetric(horizontal: 1.h),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              width: .4.h, color: AppColors.themeborder),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              width: .2.h, color: AppColors.themeColer),
                        ),
                      ),
                      keyboardType: TextInputType.phone,
                    ),
                    SizedBox(height: 5),
                      Text(
                      'Gender :',
                      style: AppFonts.fontH5semi(AppColors.themeBlack),
                    ),
                    SizedBox(height: 5),
                    Container(
                      height: 6.h,
                      width: 100.w,
                      child: Row(
                        children: [
                          Container(
                            width: 40.w,
                            child: CheckboxListTile(
                              title: Text(
                                'Male',
                                style:
                                    AppFonts.fontH5normal(AppColors.themeBlack),
                              ),
                              value: selectedgender == 'Male' ? true : false,
                              onChanged: (value) {
                                value == true
                                    ? selectedgender = "Male"
                                    : "Female";
                                setState(() {});
                              },
                            ),
                          ),
                          Container(
                            width: 45.w,
                            child: CheckboxListTile(
                              title: Text(
                                'Female',
                                style:
                                    AppFonts.fontH5normal(AppColors.themeBlack),
                              ),
                              value: selectedgender == 'Female' ? true : false,
                              onChanged: (value) {
                                value == true
                                    ? selectedgender = "Female"
                                    : "Male";
                                setState(() {});
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    widget.mobile == null
                        ? Container(
                            color: Colors.black,
                          )
                        : Container(
                            height: 10.h,
                            child: proimg == null
                                ? Container()
                                : Image.network(AppAppis.profileimg + proimg)),
                    _imageFile != null
                        ? Image.file(_imageFile!, height: 100, width: 100)
                        : Container(),
                    TextButton.icon(
                      onPressed: _pickImage,
                      icon: Icon(Icons.image),
                      label: Text('Select Image'),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      
                      onPressed: _saveProfile,
                      child: Container(width: 100.w,alignment: Alignment.center,child: Text('Save Profile')),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
