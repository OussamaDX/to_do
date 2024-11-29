import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:to_dolist_flutter/pages/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(), 
    );
  }
}