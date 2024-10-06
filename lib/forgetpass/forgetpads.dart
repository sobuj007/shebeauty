import 'package:Ghore_Parlor/utils/appFonts.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../utils/appApis.dart';
import '../utils/appColors.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  bool isLoading = false;

  Future<void> sendPasswordResetEmail() async {
    setState(() {
      isLoading = true;
    });

    var url = Uri.parse(AppAppis.endpoint +'/forgot-password');
    var response = await http.post(
      url,
      headers: {'Accept': 'application/json'},
      body: {'email': _emailController.text},
    );

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      Fluttertoast.showToast(msg: "Reset link sent to email.");
    } else {
      var jsonResponse = json.decode(response.body);
      Fluttertoast.showToast(msg: jsonResponse['message']);
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Text('Forgot Password',style: AppFonts.fontH4semi(AppColors.themeWhite),),
         backgroundColor: AppColors.themeColer,
        iconTheme: IconThemeData(
          color: AppColors.themeWhite// Change the color of the back arrow here
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 20),
            isLoading
                ? CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: sendPasswordResetEmail,
                    child: Text('Send Reset Link'),
                  ),
          ],
        ),
      ),
    );
  }
}
