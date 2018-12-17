import 'package:flutter/material.dart';

class MoviePage extends StatefulWidget {
  @override
  _MoviePageState createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      // return Container(
      //   color: Colors.white,
      //   child: SafeArea(
      //     top: true,
      //     bottom: true,
      //     child: Container(
      //       color: Colors.blue,
      //     ),
      //   ),
      // );

      return Stack(
        children: <Widget>[
          Container(
            color: Colors.blue,
          ),
          SafeArea(
            child: Container(
              color: Colors.white.withAlpha(0),
              height: 64,
              child: Row(
                children: <Widget>[
                  Material(
                    child: IconButton(
                      color: Colors.white.withAlpha(0),
                      icon: Image.asset('images/back_black.png'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  )
                  
                  // FlatButton(
                  //   color: Colors.white,
                  //   child: Image.asset('images/backb.png'),
                  //   onPressed: (){
                  //     Navigator.of(context).pop();
                  //   },
                  // )
                ],
              ),
            ),
          )
        ],
      );

      // return Scaffold(
      //   appBar: AppBar(
      //     title: Text('电影'),
      //     backgroundColor: Colors.blue,
      //     elevation: 0.0,
      //   ),
      //   // body: Container(
      //   //   padding: EdgeInsets.all(0.0),
      //   //   color: Colors.blue,
      //   // ),
      // );
    }
}