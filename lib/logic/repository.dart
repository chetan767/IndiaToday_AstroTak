import 'dart:convert';
import 'package:http/http.dart' as http;

import 'bloc/astrologer/astrologer_bloc.dart';
import 'bloc/location_state.dart';
import 'bloc/panchang/panchang_bloc.dart';

class AstrolgerRespository {
  getData() async {
    http.Response response = await http
        .get(Uri.parse("https://www.astrotak.com/astroapi/api/agent/all"));

    print("xyz");
    print(response.body);
    print("h");
    print(AstrolgerState.fromJson(response.body));
    print("h");

    return AstrolgerState.fromJson(response.body);
  }
}

class PanchangRespository {
  getData(String text, DateTime time) async {
    http.Response response = await http.post(
        Uri.parse(
            "https://www.astrotak.com/astroapi/api/horoscope/daily/panchang"),
        headers: {"Content-Type": "application/json"},
        body: json.encode({
          "day": time.day,
          "month": time.month,
          "year": time.year,
          "placeId": text
        }));

    return PanchangState.fromJson(response.body);
  }
}

class PanchangLocationRespository {
  static Future<List<LocationData>> getData(String text) async {
    print(text);
    http.Response response = await http.get(Uri.parse(
        "https://www.astrotak.com/astroapi/api/location/place?inputPlace=${text}"));

    if (response.statusCode == 200) {
      return LocationState.fromJson(response.body).data.toList();
    }
    return [];
  }
}
