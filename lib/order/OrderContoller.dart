import 'dart:convert';

import 'package:shebeauty/main.dart';
import 'package:http/http.dart'as http;
import 'package:shebeauty/utils/appStyle.dart';

class MyOrder{


  storeOrder( agentid,date,servicesProductId,pq,sq,pp,sp,selecttime) async {
    var token=tdata.getuser();
    var headersList = {
 'User-Agent': 'Thunder Client (https://www.thunderclient.com)',
 'Authorization': 'Bearer $token',
// / 'Content-Type': 'application/json' 
};
var url = Uri.parse('https://softisan.xyz/api/orders/store');

var body = {
  "agent_id": agentid,
  "date": date,
  "status": "pending",
  "service_product_ids": servicesProductId, //[3, 5]
  "product_quantities": pq,
  "service_quantities": sq,
  "product_prices": pp,
  "service_prices": sp,
  "selected_slot": 1,
  "userreqtime": selecttime
}
;

var req = http.Request('POST', url);
req.headers.addAll(headersList);
req.body = json.encode(body);


var res = await req.send();
final resBody = await res.stream.bytesToString();

if (res.statusCode >= 200 && res.statusCode < 300) {
  print(resBody);
  var d=jsonDecode(resBody);
  return d['orderid'];
  // AppStyle.snackbar("OrderCompleted", "Yur order is Placed,Thankyou!");
}
else {
  
  print(res.reasonPhrase);
  return "";
}
  }
}