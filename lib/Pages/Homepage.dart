import 'package:clippy_flutter/arc.dart';
import 'package:flutter/material.dart';
import 'package:moneymanager/Widgets/AllExpenseWidget.dart';
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
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Stack(
              children: [
                // Section supérieure (fond dégradé)
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Theme.of(context).primaryColor,
                        Theme.of(context).colorScheme.secondary,
                      ],
                      begin: Alignment.bottomRight,
                      end: Alignment.topLeft,
                    ),
                  ),
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const CircleAvatar(),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Good afternoon,',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Theme.of(context).colorScheme.tertiary,
                                ),
                              ),
                              Text(
                                'Leslie Alexander',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Theme.of(context).colorScheme.tertiary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
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
                      height: 50,
                      color: Colors.white,
                    ),
                  ),
                ),
                // Carte (par-dessus le dégradé)
                Positioned(
                  bottom: 0,
                  left: 20,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Center(
                      child: Text(
                        '\$500',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Contenu défilant
          SliverToBoxAdapter(
            child: Container(
              color: Colors.white,
              child: ListView(
                padding: const EdgeInsets.all(20),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Moneycardwidget(),
                  const SizedBox(height: 20),
                  Allexpensewidget(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
