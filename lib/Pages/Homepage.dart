import 'package:clippy_flutter/arc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:moneymanager/Widgets/AllExpenseWidget.dart';
import 'package:moneymanager/Widgets/MoneyCardWidget.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  double amount = 5150;
  double amountIncome = 5500;
  double amountExpense = 350;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Stack(
              children: [
                // Section supérieure (fond dégradé)
                Container(
                  height: 320,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 124, 28, 224),
                        Color(0xFFb781ec),
                      ],
                      begin: Alignment.bottomRight,
                      end: Alignment.topLeft,
                    ),
                  ),
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 40,
                                ),
                                Row(
                                  children: [
                                    const CircleAvatar(
                                      backgroundImage:
                                          AssetImage("images/img1.jpg"),
                                      radius: 25,
                                    ),
                                    const SizedBox(width: 10),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Good afternoon,',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .tertiary,
                                          ),
                                        ),
                                        Text(
                                          'Leslie Alexander',
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .tertiary,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // Arc en bas du conteneur
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Arc(
                    height: 30,
                    edge: Edge.TOP,
                    arcType: ArcType.CONVEY,
                    child: Container(
                      height: 100,
                      color: Colors.white,
                    ),
                  ),
                ),
                // Carte (par-dessus le dégradé)
                Positioned(
                  bottom: 16,
                  left: 20,
                  child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 168,
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(0, 7),
                                blurRadius: 10,
                                spreadRadius: 2,
                                color: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.5))
                          ]),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 15,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Total Balance',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .tertiary,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '😊',
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              '\$ ${NumberFormat('#,##0.00').format(amount)}',
                              style: TextStyle(
                                  fontSize: 25,
                                  color: Theme.of(context).colorScheme.tertiary,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          CupertinoIcons.arrow_down_circle,
                                          size: 25,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          'Income',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .tertiary,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      '\$ ${NumberFormat('#,##0.00').format(amountIncome)} ',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .tertiary,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          CupertinoIcons.arrow_up_circle,
                                          size: 25,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          'Expenses',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .tertiary,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      '\$ ${NumberFormat('#,##0.00').format(amountExpense)} ',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .tertiary,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      )),
                ),
              ],
            ),
          ),

          // Contenu défilant
          SliverToBoxAdapter(
            child: Allexpensewidget(),
          ),
        ],
      ),
    );
  }
}
