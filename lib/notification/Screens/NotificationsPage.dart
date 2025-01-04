import 'package:flutter/material.dart';
import 'package:Ghore_Parlor/utils/appColors.dart';
import 'package:Ghore_Parlor/utils/appFonts.dart';
import 'package:Ghore_Parlor/utils/custom%20widget/CustomAppbar.dart';
import 'package:Ghore_Parlor/utils/custom%20widget/CustomAppbar2.dart';
import 'package:sizer/sizer.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppbar(
            title: 'Notification',
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.w),
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 0.0),
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                      child: ListTile(
                    leading: const CircleAvatar(
                      child: Icon(Icons.notifications),
                    ),
                    title: const Text("New Notification"),
                    titleTextStyle: AppFonts.fontH5normal(AppColors.themeBlack),
                    subtitle: Expanded(
                        child: Text("New Notification hhghhjhlk llkjjnbn",
                            style:
                                AppFonts.fontH7normal(AppColors.themeBlack))),
                  ));
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
