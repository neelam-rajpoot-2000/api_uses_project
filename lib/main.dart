import 'package:api_uses_project/http_screen.dart';
import 'package:api_uses_project/modals/news_data.dart';
import 'package:api_uses_project/stories.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      home:ChangeNotifierProvider(
        create: (context)=> NewsData(),
        builder: (context,child){
          return StoriesScreen();
        },
      )
    );
  }
}
