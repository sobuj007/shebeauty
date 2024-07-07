import 'package:flutter/material.dart';

class SingelProfile extends StatefulWidget {
  const SingelProfile({super.key});

  @override
  State<SingelProfile> createState() => _SingelProfileState();
}

class _SingelProfileState extends State<SingelProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Text("Profile"),
      )),
    );
  }
}
