import 'package:api_uses_project/http_screen.dart';
import 'package:flutter/material.dart';

import 'api_screen.dart';
import 'data_from_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:DataFromApi(),
    );
  }
}
