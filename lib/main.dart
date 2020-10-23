import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:socket_series_app/screens/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      initialRoute: 'home',
      routes: {'home': (_) => Home()},
    );
  }
}
