import 'package:flutter/material.dart';
import 'package:re_exam/utils/cartpage.dart';
import 'package:re_exam/utils/detailpage.dart';
import 'package:re_exam/utils/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      routes: {
        '/':(context)=> homepage(),
        '/details':(context)=> details(),
        '/cart':(context)=> cartpage(),
      },
    );
  }
}

