import 'package:flutter/material.dart';
import 'package:untitled3/homepage.dart';
import 'package:provider/provider.dart';

var listMy = ["my", "home", "page",];

void main() {

  runApp(Provider(
    create: (context) => listMy,
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.transparent,
        )
      ),
    );
  }
}