import 'dart:convert';

import 'package:gomama/booking_data.dart';
import 'package:gomama/constants.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class Database {
  static Future<String> verifyUserPass(String username, String password) async {
    var result;
    String a = "";
    Future<Response> response = http.post(
      Uri.parse('https://hackviolet-api-5cbt6nlbxq-uk.a.run.app/auth'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
          <String, String>{'username': username, 'password': password}),
    );

    //response.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    await response.then((value) {
      if (value.statusCode == 200) {
        result = jsonDecode(value.body) as Map<String, dynamic>;
        print(result['status']);
        a = result['status'];
      } else {
        print(value.statusCode);
        a = "failure";
      }
    });
    // Don't let them do empty field check
    return Future.value(a);
    //return Future.value("success");
  }

  static Future<bool> getMatch(String username, String hours) async {
    bool a = false;
    var result;
    Future<Response> response = http.post(
      Uri.parse('https://hackviolet-api-5cbt6nlbxq-uk.a.run.app/match'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{'username': username, 'hours': hours}),
    );

    await response.then((value) {
      if (value.statusCode == 200) {
        result = jsonDecode(value.body) as Map<String, dynamic>;
        List matches = result['recommended_matches'];
        matches.forEach((element) {
          if (bookingData != null) {
            print(element);
            bookingData!.add(BookingData(
                email: element['email'],
                hours: element['hours'],
                name: element['name'],
                location: "${element['street address']}, ${element["pincode"]}",
                phone: element['phone'],
                schedule: element['schedule'],
                rating: element['ratings'],
                username: element["username"]));
          }
        });
      }
    });

    a = true;
    print(true);
    print(bookingData);
    return Future.value(a);
  }

  static void confirmBooking(String username, String providerID, String date,
      String startTime, String endTime) async {
    Future<Response> response = http.post(
      Uri.parse('https://hackviolet-api-5cbt6nlbxq-uk.a.run.app/book'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'provider_id': providerID,
        'date': date,
        'start_time': startTime,
        'end_time': endTime
      }),
    );
  }
}
