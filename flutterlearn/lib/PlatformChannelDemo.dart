
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PlatformChannelPage extends StatefulWidget {
  @override
  _PlateformChannelPageState createState() => _PlateformChannelPageState();
}

class _PlateformChannelPageState extends State<PlatformChannelPage> {

  static const MethodChannel methodChannel = MethodChannel('samples.flutter.io/battery');
  String batteryLevel = '';

  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return Scaffold(
        appBar: AppBar(
          title: Text('Platform Channel Page'),
        ),
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('$batteryLevel'),
            RaisedButton(
              child: Text('Get Battery Level'),
              onPressed: getBatteryLevel,
            )
          ],
        ),
      );
    }
  
  Future<void> getBatteryLevel() async {
    String level = '';
    try {
      final int result = await methodChannel.invokeMethod('getBatteryLevel');
      level = 'Battery level: $result';
    } on PlatformException {
      level = 'Failed to get battery level.';
    }

    setState(() {
          batteryLevel = level;
    });
  }
}
