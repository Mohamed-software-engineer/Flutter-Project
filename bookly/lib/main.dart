import 'package:bookly/features/auth/presentation/screens/splashScreen.dart';
import 'package:bookly/features/explor/presentation/screens/book_details.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "BookDetails":(context)=>BookDetails(),
      },
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
