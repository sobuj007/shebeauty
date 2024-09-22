import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:Ghore_Parlor/main.dart';
import 'package:Ghore_Parlor/order/review/ratingingmodel.dart';

class ReviewController extends GetxController {
  // Observable list for reviews
  var reviewsList = <Reviews>[].obs;
  var isLoading = true.obs;

  // Function to fetch reviews by agent_id
  Future<void> fetchReviews(int agentId) async {
    var token=tdata.getuser();
    try {
      isLoading(true);
      var headersList = {
       
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json'
      };

      var url = Uri.parse('https://softisan.xyz/api/reviews/agent/$agentId');

      var req = http.Request('GET', url);
      req.headers.addAll(headersList);

      var res = await req.send();
      final resBody = await res.stream.bytesToString();

      if (res.statusCode >= 200 && res.statusCode < 300) {
        // Parse the response and update the list of reviews
        var jsonData = json.decode(resBody);
        print(jsonData);
        var ratingModel = RatingModel.fromJson(jsonData);

        // Clear the previous list and add the new reviews
        reviewsList.clear();
        reviewsList.addAll(ratingModel.reviews!);
      } else {
        print('Error: ${res.reasonPhrase}');
      }
    } catch (e) {
      print('Error fetching reviews: $e');
    } finally {
      isLoading(false);
    }
  }
}
