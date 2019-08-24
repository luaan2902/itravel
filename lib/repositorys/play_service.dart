import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:itravel/travel/travel.dart';

class PlaceService {
  static Future<List<Travel>> searchTravel(String keyword) async {
    String url =
        "https://maps.googleapis.com/maps/api/place/textsearch/json?type=travel_agency&key=AIzaSyBSxLoeVH330_x1JYvbWXnNmGFAKFKOPeE" +
            "&language=vi&region=VN&query=" +
            Uri.encodeQueryComponent(keyword);

    print("search >>: " + url);
    var res = await http.get(url);
    if (res.statusCode == 200) {
      return Travel.fromJson(json.decode(res.body));
    } else {
      return new List();
    }
  }
}