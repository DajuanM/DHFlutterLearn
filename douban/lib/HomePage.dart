import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_refresh/flutter_refresh.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var page = 0;
  List<dynamic> data = [];

  loadData() async {
    String url = 'https://api.douban.com/v2/movie/in_theaters?city=成都&start=0&count=10';
    http.Response response = await http.get(url);
    setState(() {
          data = json.decode(response.body)['subjects'];
    });

  }

  @override
    void initState() {
      // TODO: implement initState
      super.initState();
      loadData();
    }


  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return Scaffold(
        appBar: AppBar(
          title: Text('热映电影'),
        ),
        body: Refresh(
          onHeaderRefresh: onHeaderRefresh,
          onFooterRefresh: onFooterRefresh,
          childBuilder: (context, {controller, physics}) {
            return ListView.builder(
              controller: controller,
              physics: physics,
              itemCount: data.length,
              itemBuilder: (context, index) {
                return createTile(index);
              },
            );
          },
        )
      );
    }

  Future<Null> onHeaderRefresh() async {
    String url = 'https://api.douban.com/v2/movie/in_theaters?city=成都&start=${0}&count=10';
    http.Response response = await http.get(url);
    setState(() {
          data = json.decode(response.body)['subjects'];
    });
  }

  Future<Null> onFooterRefresh() async {
    String url = 'https://api.douban.com/v2/movie/in_theaters?city=成都&start=${data.length}&count=10';
    http.Response response = await http.get(url);
    setState(() {
        List<dynamic> arr = json.decode(response.body)['subjects'];
        data += arr;
    });
  }

  createTile(int index) {
    if (data.length == 0) {
      return Container();
    }
    // var subjects = data['subjects'];
    var item = data[index];

    String actorStr = "";
    for (var actor in item['casts']) {
      actorStr += actor['name'] + ' / ';
    }

    int count = 0 ;
    var countStr = '';
    int realCount = item['collect_count'];
    if (realCount > 10000) {
      count = realCount ~/ 10000;
      countStr = '${count}万';
    }else {
      count = realCount;
      countStr = '${count}';
    }


    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(15),
      child: Row(
        children: <Widget>[
          Container(
            child: Image.network(
              // 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2541280047.jpg'
              '${item['images']['small']}'
            ),
            width: 80,
            height: 100,
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
              alignment: AlignmentDirectional.topStart,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text('${item['title']}'),
                  Text('评分：${item['rating']['average']}分'),
                  Text('导演：${item['directors'][0]['name']}'),
                  Text('主演：$actorStr'),
                ],
              ),
            )
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('${countStr}人看过', style: TextStyle(color: Colors.red, fontSize: 13)),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(width: 1.0, color: Colors.red)
                  ),
                  child: FlatButton(
                    child: Text('购票', style: TextStyle(color: Colors.red, fontSize: 15)),
                    color: Colors.white,
                    onPressed: (){},
                  ),
                  width: 80,
                  height: 40,
                )
              ],
            ),
            width: 80,
            height: 100,
          ),
          Divider()
        ],
      ),
    );
  }
}