import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../utils/appApis.dart';
import '../utils/appColors.dart';
import '../utils/appFonts.dart';

class ResetPasswordScreen extends StatefulWidget {
  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _tokenController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  bool isLoading = false;

  Future<void> resetPassword() async {
    if (_passwordController.text != _confirmPasswordController.text) {
      Fluttertoast.showToast(msg: "Passwords do not match.");
      return;
    }

    setState(() {
      isLoading = true;
    });

    var url = Uri.parse(AppAppis.endpoint +'reset-password');
    var response = await http.post(
      url,
      headers: {'Accept': 'application/json'},
      body: {
        'email': _emailController.text,
        'token': _tokenController.text,
        'password': _passwordController.text,
        'password_confirmation': _confirmPasswordController.text,
      },
    );

    if (response.statusCode == 200) {
      Fluttertoast.showToast(msg: "Password reset successful.");
      Navigator.of(context).pop();
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
        title: Text('Reset Password',style: AppFonts.fontH4semi(AppColors.themeWhite),),
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
            SizedBox(height: 10),
            TextFormField(
              controller: _tokenController,
              decoration: InputDecoration(
                labelText: 'Token',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'New Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _confirmPasswordController,
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            isLoading
                ? CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: resetPassword,
                    child: Text('Reset Password'),
                  ),
          ],
        ),
      ),
    );
  }
}
