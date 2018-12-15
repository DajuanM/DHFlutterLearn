import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'RankPage.dart';

class TabPage extends StatefulWidget {
  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {

  int _currentIndex = 0;
  List<StatefulWidget> _pageArr = [HomePage(), RankPage()];

  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return Scaffold(
        body: Center(
          child: _pageArr[_currentIndex],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index){
            setState(() {
                _currentIndex = index;
            });
          },
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.ac_unit),
              title: Text('Hot')
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.access_alarms),
              title: Text('Rank')
            )
          ],
        )
      );
    }
}