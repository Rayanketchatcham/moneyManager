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
      padding: EdgeInsets.symmetric(horizontal: 25,),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'All Expenses',
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                width: 100,
                height: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Theme.of(context).colorScheme.secondary),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'View All',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Icon(
                      Icons.keyboard_arrow_down,
                      size: 25,
                      color: Colors.black,
                    )
                  ],
                ),
              )
            ],
          ),SizedBox(height: 10,),
          Text(
            'Today',
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey),
          ),
          Expenseitem(),
          Expenseitem(),
          Expenseitem(),Expenseitem(),Expenseitem(),Expenseitem(),Expenseitem(),
        ],
      ),
    );
  }
}
