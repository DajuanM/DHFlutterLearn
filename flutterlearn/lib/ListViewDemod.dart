import 'package:flutter/material.dart';

//命名 不能有数字，结尾不能大写
class ListViewPaged extends StatefulWidget {
  @override
  _ListViewPagedState createState() => _ListViewPagedState(items: List.generate(1000, (i) => 'Item ${i}'));
}

class _ListViewPagedState extends State<ListViewPaged> {

  final List<String> items;
  _ListViewPagedState({this.items}): super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView Page'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('${items[index]}'),
          );
        },
      ),
    );
  }
}