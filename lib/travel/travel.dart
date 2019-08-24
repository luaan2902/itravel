import 'package:equatable/equatable.dart';
import 'dart:convert';

class Travel extends Equatable {
  String id;
  String name;
  String address;
  String photo;
  double rating;
  int user_ratings_total;

  Travel(this.id, this.name, this.address, this.photo, this.rating, this.user_ratings_total);

  @override
  String toString() => 'Travel { id: $id }';

  static List<Travel> fromJson(Map<String, dynamic> json) {
    print("parse data");
    List<Travel> rs = new List();

    var results = json['results'] as List;
    for (var item in results) {
      var p = new Travel(
          item['place_id'],
          item['name'],
          item['formatted_address'],
          item['photos']==null?"":item['photos'][0]['photo_reference'],
          double.parse(item['rating'].toString()),
          int.parse(item['user_ratings_total'].toString()));
      rs.add(p);
    }

    return rs;
  }
}