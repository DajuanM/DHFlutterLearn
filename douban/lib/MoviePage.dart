import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';// iOS风格组件

class MoviePage extends StatefulWidget {
  @override
  _MoviePageState createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      color: Colors.brown,
                      child: SafeArea(
                        bottom: false,
                        child: Container(
                          margin: EdgeInsets.only(top: 64),
                          child: Center(
                            child: Image.network(
                            'https://img3.doubanio.com/view/celebrity/s_ratio_celebrity/public/p32853.jpg',
                          ),
                          ),
                        ),
                      ),
                      height: 450,
                    ),
                  ],
                )
              ),
            SafeArea(
              child: Container(
                color: Colors.white.withOpacity(0),
                height: 64,
                child: Row(
                  children: <Widget>[
                    CupertinoButton(
                      child: Image.asset('images/back_black.png'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    Expanded(
                      child: Text('电影', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black), textAlign: TextAlign.center,),
                    ),
                    CupertinoButton(
                      child: Image.asset('images/back_black.png'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );

      return Container(
        color: Colors.white,
        
      );
    }
}