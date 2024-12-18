import 'dart:convert';

import 'package:Ghore_Parlor/main.dart';
import 'package:http/http.dart' as http;
import 'package:Ghore_Parlor/utils/appStyle.dart';

import '../utils/appApis.dart';

class MyOrder {
  storeOrder(result) async {
    var token = tdata.getuser();
    var sendingData = jsonEncode(result);
    print('sendingData');
    print(sendingData);
    var headersList = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    };
    var url = Uri.parse(AppAppis.endpoint + 'orders/new');

    var body = sendingData;

//  {"agent_id":["2","3","2"],"date":["12/9/2024","15/9/2024","13/9/2024"],"status":"pending","service_product_ids":["13","10","1"],"product_quantities":["1","3","1"],"service_quantities":["1","1","1"],"product_prices":["1213.00","100.00","2.00"],"service_prices":["222.00","150.00","1.00"],"selected_slot":["07:59","21:27","21:32"],"userreqtime":["07:59","21:27","21:32"]};

    var req = http.Request('POST', url);
    req.headers.addAll(headersList);
    req.body = sendingData;

    var res = await req.send();
    final resBody = await res.stream.bytesToString();

    if (res.statusCode >= 200 && res.statusCode < 300) {
      print('resBody');
      print(resBody);
      var geting = jsonDecode(resBody);
      return geting['order']['id'].toString();
    } else {
      print('error');
      print(res.reasonPhrase);
      return '';
    }
  }

  paymentStore(id, total, transid, type, address, notes, mobile) async {
    var token = tdata.getuser();
    print("res");
    print(id);
    print(total);
    print(transid);
    print(type);
    print(address);
    print(notes);
    print(mobile);
    var headersList = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    };
    var url = Uri.parse(AppAppis.endpoint + 'paystore');

    var body = {
      "order_id": id.toString(),
      "amount": total,
      "status": type.toString(),
      "trans_type": transid.toString(),
      "address": address.toString(),
      "notes": notes.toString(),
      "mobile": mobile
    };
    print(jsonEncode(body));
    var req = http.Request('POST', url);
    req.headers.addAll(headersList);
    req.body = jsonEncode(body);

    var res = await req.send();
    final resBody = await res.stream.bytesToString();
    print(jsonDecode(resBody));
    if (res.statusCode >= 200 && res.statusCode < 300) {
      return true;
    } else {
      print(res.reasonPhrase);
      return false;
    }
  }
}
