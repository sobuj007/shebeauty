import 'package:flutter/material.dart';

class SingelAppointment extends StatefulWidget {
  const SingelAppointment({super.key});

  @override
  State<SingelAppointment> createState() => _SingelAppointmentState();
}

class _SingelAppointmentState extends State<SingelAppointment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
          child: Column(children: [
            Row(
              children: [
                Container(
                  height: 160,
                  width: 120,
                  color: Colors.black45,
                ),
                Column(
                  children: [
                    Row(
                      children: [Text("demo Title"), Icon(Icons.favorite)],
                    ),
                    Row(
                      children: [
                        Text("data"),
                        Text("data"),
                      ],
                    ),
                    Row(
                      children: [
                        Text("data"),
                        Text("data"),
                      ],
                    )
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Appointment"),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 1),
                      borderRadius: BorderRadius.circular(10)),
                  height: 70,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Time"),
                          Text("${DateTime.now()}".toString()),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ]),
        ),
      )),
    );
  }
}
