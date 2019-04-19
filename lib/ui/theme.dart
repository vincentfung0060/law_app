import 'package:flutter/material.dart';

ThemeData buildTheme() {
  // We're going to define all of our font styles
  // in this method:
  TextTheme _buildTextTheme(TextTheme base) {
    return base.copyWith(
      headline: base.headline.copyWith(
        fontFamily: 'Calibri',
        fontSize: 40.0,
        color: const Color(0xFFFFFFFF),
      ),
      // New code:
      // Used for the laws' title:
      title: base.title.copyWith(
        fontFamily: 'Calibri',
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
        color: const Color(0xFF807A6B),
      ),
      display1: base.display1.copyWith(
        fontFamily: 'Calibri',
        fontSize: 18.0,
        color: const Color(0xFF807A6B),
        decoration: TextDecoration.underline,
      ),
    );
  }

  // We want to override a default light blue theme.
  final ThemeData base = ThemeData.light();

  // And apply changes on it:
  return base.copyWith(
    textTheme: _buildTextTheme(base.textTheme),
    primaryColor: const Color(0xFFFFF8E1),
    indicatorColor: const Color(0xFF807A6B),
    scaffoldBackgroundColor: const Color(0xFFF5F5F5),
    accentColor: const Color(0xFFFFF8E1),
    iconTheme: IconThemeData(
      color: const Color(0xFFCCC5AF),
      size: 20.0,
    ),
    buttonColor: Colors.white,
    // New:
    backgroundColor: Colors.white,
    tabBarTheme: base.tabBarTheme.copyWith(
      labelColor: const Color(0xFF807A6B),
      unselectedLabelColor: const Color(0xFFCCC5AF),
    )
  );
}