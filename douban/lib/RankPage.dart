import 'package:flutter/material.dart';

class RankPage extends StatefulWidget {
  @override
  _RankPageState createState() => _RankPageState();
}

class _RankPageState extends State<RankPage> {

  Widget showCustomScrollView() {
  return new CustomScrollView(
    slivers: <Widget>[
      const SliverAppBar(
        pinned: true,
        expandedHeight: 250.0,
        flexibleSpace: const FlexibleSpaceBar(
          title: const Text('Demo'),
        ),
      ),
      new SliverGrid(
        gridDelegate: new SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200.0,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
          childAspectRatio: 4.0,
        ),
        delegate: new SliverChildBuilderDelegate(
              (BuildContext context, int index) {
            return new Container(
              alignment: Alignment.center,
              color: Colors.teal[100 * (index % 9)],
              child: new Text('grid item $index'),
            );
          },
          childCount: 20,
        ),
      ),
      new SliverFixedExtentList(
        itemExtent: 50.0,
        delegate: new SliverChildBuilderDelegate(
              (BuildContext context, int index) {
            return new Container(
              alignment: Alignment.center,
              color: Colors.lightBlue[100 * (index % 9)],
              child: new Text('list item $index'),
            );
          },
        ),
      ),
    ],
  );
}

  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return Scaffold(
        appBar: AppBar(
          title: Text('电影排行'),
        ),
        body: Container(
          color: Colors.blue,
        ),
      );
    }
}