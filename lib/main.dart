import 'package:flutter/material.dart';
import 'package:moneymanager/Pages/AccountPage.dart';
import 'package:moneymanager/Pages/Home.dart';
import 'package:moneymanager/Pages/NotificationPage.dart';
import 'package:moneymanager/Pages/SettingPage.dart';
import 'package:moneymanager/Pages/ViewChart.dart';
import 'package:moneymanager/Pages/addTransaction.dart';
import 'package:moneymanager/assets/app_colors.dart';

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
        primaryColor: AppColors.primaryColor, // Couleur principale
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.deepPurple, // Swatch proche du violet
        ).copyWith(
          secondary: AppColors.secondaryColor, // Couleur secondaire
          tertiary: AppColors.tertiaryColor, // Couleur tertiaire
        ),
        scaffoldBackgroundColor: AppColors.backgroundColor,
      ),
      routes: {
        '/': (context) => Home(),
        '/addTransaction': (context) => Addtransaction(),
        '/ViewChart': (context) => viewChart(),
        '/account': (context) => Accountpage(),
        '/notification': (context) => Notificationpage(),
        '/setting': (context) => Settingpage(),
      }, 
    );
  }
}
