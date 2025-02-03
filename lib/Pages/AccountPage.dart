import 'package:flutter/material.dart';

class Accountpage extends StatefulWidget {
  const Accountpage({super.key});

  @override
  State<Accountpage> createState() => _AccountpageState();
}

class _AccountpageState extends State<Accountpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

          title:
          Center(
            child: Text(
              'Account',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),


            ),
          ),
        ));
  }
}