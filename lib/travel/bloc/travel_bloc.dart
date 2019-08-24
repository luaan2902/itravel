import 'dart:async';
import 'package:itravel/repositorys/play_service.dart';

class TravelBloc {
  var _travelController = StreamController();
  Stream get travelStream => _travelController.stream;

  void searchTravel(String keyword) {
    print("travel bloc search: " + keyword);

    _travelController.sink.add("start");
    PlaceService.searchTravel(keyword).then((rs) {
      _travelController.sink.add(rs);
    }).catchError(() {
//      _placeController.sink.add("stop");
    });
  }

  void dispose() {
    _travelController.close();
  }
}