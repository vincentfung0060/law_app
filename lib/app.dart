import 'package:flutter/material.dart';
import 'package:law_app/ui/screens/home.dart';

import 'package:law_app/ui/screens/login.dart';
import 'package:law_app/ui/theme.dart';

class LawApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Law Consultation',
      theme: buildTheme(),
      routes: {
        '/': (context) => HomeScreen(),
        '/login': (context) => LoginScreen(),
      },
    );
  }
}