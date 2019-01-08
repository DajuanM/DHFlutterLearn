import 'package:flutter/material.dart';

class PageA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('找小姐姐要电话'),),
      body: Center(
        child: RouteButon(),
      ),
    );
  }
}

class RouteButon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: (){
        _navigateToNext(context);
      },
      child: Text('去找小姐姐'),
    );
  }

  _navigateToNext(BuildContext context) async {
    final result = await Navigator.push(context, MaterialPageRoute(builder: (context)=>PageB()));
    Scaffold.of(context).showSnackBar(SnackBar(content: Text('$result')));
  }
}

class PageB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(title: Text('小姐姐'),),
        body: Center(
          child: Column(
            children: <Widget>[
              RaisedButton(
                child: Text('小姐姐'),
                onPressed: (){
                  Navigator.pop(context, '13200000000');
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}