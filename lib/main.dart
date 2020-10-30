import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socket_series_app/services/socket_service.dart';
import 'package:socket_series_app/screens/home.dart';
import 'package:socket_series_app/screens/status.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => SocketService())],
      child: MaterialApp(
        title: 'Material App',
        initialRoute: 'home',
        routes: {
          'home': (_) => Home(),
          'status': (_) => StatusPage(),
        },
      ),
    );
  }
}
