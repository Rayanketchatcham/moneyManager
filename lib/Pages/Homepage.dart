import 'package:flutter/material.dart';
import 'package:moneymanager/Widgets/AllExpenseWidget.dart';
import 'package:moneymanager/Widgets/AppBarWidget.dart';
import 'package:moneymanager/Widgets/DrawerWidget.dart';
import 'package:moneymanager/Widgets/MoneyCardWidget.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawerwidget(),
        body: Stack(
          children: [
            ListView(
              children: [
                Appbarwidget(),
                Moneycardwidget(),
                Allexpensewidget(),
              ],
            ),
            Positioned(
                bottom: 20,
                right: 20,
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/addExpense');
                  },
                  child: Container(
                      padding: EdgeInsets.all(13),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(0, 3),
                                blurRadius: 10,
                                spreadRadius: 2,
                                color: Colors.grey.withOpacity(0.5))
                          ]),
                      child: Icon(
                        Icons.add,
                        size: 30,
                        color: Colors.white,
                      )),
                ))
          ],
        ));
  }
}
