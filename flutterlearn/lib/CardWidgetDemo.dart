import 'package:flutter/material.dart';

class AcardWidgetPage extends StatefulWidget {
  @override
  _AcardWidgetPageState createState() => _AcardWidgetPageState();
}
//必须要加下划线
class _AcardWidgetPageState extends State<AcardWidgetPage> {
  
  @override
  Widget build(BuildContext context) {

    var card = Card(
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('title', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            subtitle: Text('subtitle'),
            leading: Icon(Icons.access_alarm),
          ),
          Divider(),
          ListTile(
            title: Text('title', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            subtitle: Text('subtitle'),
            leading: Icon(Icons.access_alarm),
          ),
          Divider(),
          ListTile(
            title: Text('title', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            subtitle: Text('subtitle'),
            leading: Icon(Icons.access_alarm),
          )
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Image Page'),
      ),
      body: card,
    );
  }
}
