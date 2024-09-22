
import 'package:flutter/material.dart';

import '../utils/appColors.dart';
import '../utils/appFonts.dart';

class TermsAndConditionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Terms and Conditions',style: AppFonts.fontH4semi(AppColors.themeWhite),),
         backgroundColor: AppColors.themeColer,
        iconTheme: IconThemeData(
          color: AppColors.themeWhite// Change the color of the back arrow here
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Terms and Conditions',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Introduction',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'These terms and conditions outline the rules and regulations for the use of this app. By accessing this application, we assume you accept these terms and conditions in full. Do not continue to use the app if you do not accept all of the terms and conditions stated on this page.',
              ),
              SizedBox(height: 20),
              Text(
                'License to Use',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Unless otherwise stated, the app and/or its licensors own the intellectual property rights for all material on the app. All intellectual property rights are reserved. You may view and/or print pages from the app for your own personal use subject to restrictions set in these terms and conditions.',
              ),
              SizedBox(height: 20),
              Text(
                'User Responsibilities',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'By using the app, you agree to follow all applicable laws and regulations, and you agree not to engage in any illegal activities while using this app.',
              ),
              SizedBox(height: 20),
              Text(
                'Termination',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'We may terminate or suspend your access to our app without prior notice or liability, for any reason whatsoever, including without limitation if you breach the Terms.',
              ),
              SizedBox(height: 20),
              Text(
                'Changes to Terms',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'We reserve the right, at our sole discretion, to modify or replace these Terms at any time. By continuing to access or use our app after those revisions become effective, you agree to be bound by the revised terms.',
              ),
              SizedBox(height: 40),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Go back to the previous screen
                  },
                  child: Text('I Agree'),
                  style: ElevatedButton.styleFrom(
                    overlayColor: Colors.teal,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    textStyle: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
