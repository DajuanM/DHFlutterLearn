import 'package:flutter/material.dart';

class GridViewPage extends StatefulWidget {
  @override
  _GridViewPageState createState() => _GridViewPageState();
}

class _GridViewPageState extends State<GridViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Page'),
      ),
      body: GridView(
        scrollDirection: Axis.vertical,//默认
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,//每行显示列数
          mainAxisSpacing: 10.0,//滚动方向，横向间隔
          crossAxisSpacing: 2.0,//滚动方向，纵向间隔
          childAspectRatio: 0.8 //宽高比
        ),
        children: <Widget>[
          Image.network(
            'https://i0.hdslb.com/bfs/sycp/tmaterial/201812/42c93b99614d3bb7bd0eca6b691fca09.jpg',
            fit: BoxFit.cover
          ),
          Image.network(
            'https://i0.hdslb.com/bfs/sycp/tmaterial/201812/42c93b99614d3bb7bd0eca6b691fca09.jpg',
            fit: BoxFit.cover
          ),
          Image.network(
            'https://i0.hdslb.com/bfs/sycp/tmaterial/201812/42c93b99614d3bb7bd0eca6b691fca09.jpg',
            fit: BoxFit.cover
          )
        ],
      ),
      // body: GridView.count(
      //   padding: const EdgeInsets.all(10),
      //   crossAxisSpacing: 10,
      //   crossAxisCount: 3,
      //   children: <Widget>[
      //     const Text("asdsad"),
      //     const Text("asdsad"),
      //     const Text("asdsad"),
      //     const Text("asdsad"),
      //     const Text("asdsad")
      //   ],
      // )
    );
  }
}
