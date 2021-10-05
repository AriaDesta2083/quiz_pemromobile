import 'package:flutter/material.dart';
import 'package:quiz_aria/pages/home_page.dart';
import 'pages/detail_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      routes: {
        '/home': (BuildContext ctx) => HomePage(),
        '/detail': (BuildContext ctx) => DetailPage(),
      },
    );
  }
}
