import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:itravel/home_page.dart';
import 'package:itravel/profile_page.dart';
import 'package:itravel/search_page.dart';

class HomeScreen extends StatefulWidget {
  final String name;

  HomeScreen({Key key, @required this.name}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{
  int _selectPage = 0;
  final _pageOption = [
    HomePage(),
    SearchPage(),
    ProfilePage()
  ];
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
        body: _pageOption[_selectPage],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectPage,
          backgroundColor: Colors.white,
          onTap: (int index){
            setState(() {
              _selectPage = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("Home")
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.search),
                title: Text("Search")
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.assignment_ind),
                title: Text("Profile")
            ),
          ],
        ),
      ),
    );
  }
}
