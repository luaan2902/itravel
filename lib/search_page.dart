import 'package:flutter/material.dart';
import 'package:loadmore/loadmore.dart';
import 'travel/bloc/travel_bloc.dart';
import 'travel/travel.dart';
import 'utils.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  var _travelController;
  var travelBloc = TravelBloc();

  @override
  void initState() {
    _travelController = TextEditingController(text: "");
    super.initState();
  }

  @override
  void dispose() {
    travelBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0xFF696D77), Color(0xFF292C36)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              tileMode: TileMode.clamp)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          padding: EdgeInsets.only(top: 10),
          constraints: BoxConstraints.expand(),
          color: Colors.transparent,
          child: Column(
            children: <Widget>[
              Container(
                color: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    width: double.infinity,
                    height: 60,
                    child: Stack(
                      alignment: AlignmentDirectional.centerStart,
                      children: <Widget>[
                        SizedBox(
                          width: 40,
                          height: 60,
                          child: Center(
                            child: Icon(Icons.search, color: Colors.white,),
                          ),
                        ),
                        Positioned(
                          right: 0,
                          top: 0,
                          width: 40,
                          height: 60,
                          child: Center(
                            child: FlatButton(
                                onPressed: () {
                                  _travelController.text = "";
                                },
                                child: Icon(Icons.backspace, color: Colors.white,)),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 50, right: 50),
                          child: TextField(
                            controller: _travelController,
                            textInputAction: TextInputAction.search,
                            onSubmitted: (str) {
                              travelBloc.searchTravel(str);
                            },
                            style: TextStyle(
                                fontSize: 16, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                  height: screenAwareSize(520.0, context),
                  child: LoadMore(
                    onLoadMore: null,
                    child: StreamBuilder(
                        stream: travelBloc.travelStream,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            print(snapshot.data.toString());
                            if (snapshot.data == "start") {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            print(snapshot.data.toString());
                            List<Travel> places = snapshot.data;
                            return ListView.separated(
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return tileTravel(
                                    (places.elementAt(index).name == null
                                        ? ''
                                        : places.elementAt(index).name),
                                    (places.elementAt(index).address == null
                                        ? ''
                                        : places.elementAt(index).address),
                                    (places.elementAt(index).photo == null
                                        ? ''
                                        : places.elementAt(index).photo),
                                    (places.elementAt(index).rating == null
                                        ? ''
                                        : places.elementAt(index).rating),
                                    (places
                                                .elementAt(index)
                                                .user_ratings_total ==
                                            null
                                        ? ''
                                        : places
                                            .elementAt(index)
                                            .user_ratings_total));
                                /*        return ListTile(
                                  title: Text(places.elementAt(index).name == null
                                      ? ''
                                      : places.elementAt(index).name),
                                  subtitle: Text(
                                      places.elementAt(index).address == null
                                          ? ''
                                          : places.elementAt(index).address),
                                  onTap: () {
                                    print("on tap");

                                  },
                                );*/
                              },
                              itemCount: places.length,
                              separatorBuilder: (context, index) => Divider(
                                height: 0,
                                color: Colors.transparent,
                              ),
                            );
                          } else {
                            return Container();
                          }
                        }),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

Widget tileTravel(
    String name, String address, String img, double rating, int total_rating) {
  return Container(
    width: double.infinity,
    child: Card(
      color: Colors.white,
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                img == ""
                    ? Image.asset(
                        "img_not_available.png",
                        height: 100,
                      )
                    : Image.network(
                        "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=" +
                            img +
                            "&key=AIzaSyBSxLoeVH330_x1JYvbWXnNmGFAKFKOPeE",
                        height: 100,
                        width: 150,
                        fit: BoxFit.cover,
                      ),
                Row(
                  children: <Widget>[
                    Text(
                      "Rating:  ",
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                    Text(rating.toString(), style: TextStyle(color: Colors.amber),),
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    Text(" (" + total_rating.toString() + ")"),
                  ],
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
              child: Text(
                name,
                style: TextStyle(fontSize: 18, color: Colors.blueAccent),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(address),
            ),
          ],
        ),
      ),
    ),
  );
}
