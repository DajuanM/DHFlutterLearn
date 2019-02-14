import 'package:flutter/material.dart';
import 'pages/home_screen.dart';
import 'pages/airplay_screen.dart';
import 'pages/email_screen.dart';

class BottomNavigationWidget extends StatefulWidget {
  _BottomNavigationWidgetState createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  final _bottomNavigationColor = Colors.blue;
  int _currentIndex = 0;
  List<Widget> list = List();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    list
      ..add(HomeScreen())
      ..add(EmailScreen())
      ..add(AirplayScreen());
      
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            title: Text('Home', style: TextStyle(color: _bottomNavigationColor),),
            icon: Icon(
              Icons.home,
              color: _bottomNavigationColor,
            )
          ),
          BottomNavigationBarItem(
            title: Text('Email', style: TextStyle(color: _bottomNavigationColor),),
            icon: Icon(
              Icons.email,
              color: _bottomNavigationColor,
            )
          ),
          BottomNavigationBarItem(
            title: Text('Airplay', style: TextStyle(color: _bottomNavigationColor),),
            icon: Icon(
              Icons.airplay,
              color: _bottomNavigationColor,
            )
          ),
        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}