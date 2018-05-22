import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter-Native Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Channel demo app'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  static const platform = const MethodChannel(
      'flutter.rortega.com.basicchannelcommunication');
  final String title;

  const MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new RaisedButton(
              child: new Text('Show native view'),
              onPressed: _showNativeView,
            ),
          ],
        ),
      ),
    );
  }

  Future<Null> _showNativeView() async {
    await platform.invokeMethod('showNativeView');
  }
}
