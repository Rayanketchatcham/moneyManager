import 'package:flutter/material.dart';
import 'package:moneymanager/Widgets/ExpenseItem.dart';

class Allexpensewidget extends StatefulWidget {
  const Allexpensewidget({super.key});

  @override
  State<Allexpensewidget> createState() => _AllexpensewidgetState();
}

class _AllexpensewidgetState extends State<Allexpensewidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25,vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Transactions History',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'See All',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),SizedBox(height: 8,),

          Expenseitem(),
          Expenseitem(),
          Expenseitem(),Expenseitem(),Expenseitem(),
        ],
      ),
    );
  }
}
