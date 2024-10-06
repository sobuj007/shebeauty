import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Ghore_Parlor/auth/Controllers/userContoller.dart';
import 'package:Ghore_Parlor/main.dart';
import 'package:Ghore_Parlor/utils/appStyle.dart';

import '../../utils/appApis.dart';
import '../../utils/appColors.dart';
import '../../utils/appFonts.dart';
import 'package:http/http.dart' as http;

class AddReviewScreen extends StatefulWidget {
  final agentid;
  final productid;

   AddReviewScreen({required this.agentid,required  this.productid,super.key});
  @override
  _AddReviewScreenState createState() => _AddReviewScreenState();
}

class _AddReviewScreenState extends State<AddReviewScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _reviewerNameController = TextEditingController();
  final TextEditingController _commentController = TextEditingController();
  var getuser=Get.put(Usercontoller());
  int? _rating;

  // Function to submit the review
  Future<void> _submitReview() async {
    var token= tdata.getuser();
    var userdata=getuser.getUser();
    var userprofile=getuser.getProfile();
    print(userprofile);
    if (_formKey.currentState!.validate()) {
      // Send review data to server (API call)
  //     print(userdata['id']);
  //     print(widget.productid);
  //     print(widget.agentid);
  //     print(userdata['name']);
  //     print(userprofile['img']);
  //  //   print(getuser.getUser().image);
  //     print('Rating: $_rating');
  //     print('Comment: ${_commentController.text}');

      // Perform API call to submit the review
      // Use your API function here
      var headersList = {

 'Accept': 'application/json',
 'Content-Type': 'application/json',
 'Authorization': 'Bearer $token' 
};
var url = Uri.parse(AppAppis.endpoint +'reviews');

var body = // {

{
    "rating":_rating,
    "comment":_commentController.text,
    "reviewername":userdata['name'],
    "agent_id":widget.agentid,
    "serviceproduct_id":widget.productid,
    "image":userprofile['img'],
    "user_id":userdata['id']
};

var req = http.Request('POST', url);
req.headers.addAll(headersList);
req.body = json.encode(body);


var res = await req.send();
final resBody = await res.stream.bytesToString();

if (res.statusCode >= 200 && res.statusCode < 300) {
  print(resBody);
  AppStyle.snackbar("Rating ", "Thank you for Valuable Comment");
  Navigator.pop(context);
}
else {
  print(res.reasonPhrase);
}
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Review',style: AppFonts.fontH4semi(AppColors.themeWhite),),
         backgroundColor: AppColors.themeColer,
        iconTheme: IconThemeData(
          color: AppColors.themeWhite// Change the color of the back arrow here
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Reviewer Name
              // TextFormField(
              //   controller: _reviewerNameController,
              //   decoration: InputDecoration(
              //     labelText: 'Reviewer Name',
              //     border: OutlineInputBorder(),
              //   ),
              //   validator: (value) {
              //     if (value == null || value.isEmpty) {
              //       return 'Please enter your name';
              //     }
              //     return null;
              //   },
              // ),
              SizedBox(height: 16),

              // Rating Dropdown
              DropdownButtonFormField<int>(
                decoration: InputDecoration(
                  labelText: 'Rating',
                  border: OutlineInputBorder(),
                ),
                value: _rating,
                items: List.generate(5, (index) => index + 1)
                    .map((value) => DropdownMenuItem(
                          value: value,
                          child: Text('$value stars'),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _rating = value;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return 'Please select a rating';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              // Comment
              TextFormField(
                controller: _commentController,
                decoration: InputDecoration(
                  labelText: 'Comment',
                  border: OutlineInputBorder(),
                ),
                maxLines: 5,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a comment';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              // Submit Button
              ElevatedButton(
                onPressed: _submitReview,
                child: Text('Submit Review'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
