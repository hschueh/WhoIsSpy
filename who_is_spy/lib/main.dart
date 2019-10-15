import 'package:flutter/material.dart';
import 'package:who_is_spy/config_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '誰是臥底',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: WISHomePage(),
    );
  }
}

class WISHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
    children: <Widget>[
      Text('誰是臥底'),
      RaisedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ConfigPage()),
          );
        },
        child: const Text(
          '開始遊戲',
          style: TextStyle(fontSize: 20)
        ),
      ),
      RaisedButton(
        onPressed: () {},
        child: const Text(
          '新增詞庫',
          style: TextStyle(fontSize: 20)
        ),
      ),
    ],
  );
  }
}