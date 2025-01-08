import 'package:flutter/material.dart';
import 'package:moneymanager/Pages/Homepage.dart';
import 'package:moneymanager/Pages/ViewChart.dart';
import 'package:moneymanager/Pages/addExpense.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Money Manager',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: Colors.grey,
            colorScheme: ColorScheme.fromSwatch(
              primarySwatch: Colors.grey,
            ).copyWith(
              secondary: Color(0xFFF3F3F3), // Couleur secondaire
              tertiary: Color(0xFF830DFB), // Couleur tertiaire
            ),
            scaffoldBackgroundColor: Colors.white),
        routes: {
          '/': (context) => Homepage(),
          '/addExpense': (context) => Addexpense(),
          '/ViewChart': (context) => viewChart(),
        });
  }
}
