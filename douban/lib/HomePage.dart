import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return Scaffold(
        appBar: AppBar(
          title: Text('热映电影'),
        ),
        body: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return createTile();
          },
        )
      );
    }

  createTile() {
    return Container(
      padding: EdgeInsets.all(15),
      child: Row(
        children: <Widget>[
          Container(
            child: Image.network(
              'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2541280047.jpg'
            ),
            width: 80,
            height: 100,
          ),
          Container(
            child: Image.network(
              'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2541280047.jpg'
            ),
            width: 80,
            height: 100,
          ),
          Container(
            child: Image.network(
              'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2541280047.jpg'
            ),
            width: 80,
            height: 100,
          ),
        ],
      ),
    );
  }
}