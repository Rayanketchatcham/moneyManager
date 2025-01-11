import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Drawerwidget extends StatefulWidget {
  const Drawerwidget({super.key});

  @override
  State<Drawerwidget> createState() => _DrawerwidgetState();
}

class _DrawerwidgetState extends State<Drawerwidget> {
  String name = 'Rayan Ketchatcham';
  double amountBalance = 45678.78;
  String date = '12/12/2024';

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('images/img6.jpg'),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Balance: \$${amountBalance.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [

                ListTile(
                  leading: Icon(
                    CupertinoIcons.home,
                    color: Colors.black,
                  ),
                  title: Text(
                    'Home',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/');
                  },
                ),
                ListTile(
                  leading: Icon(
                    CupertinoIcons.person,
                    color: Colors.black,
                  ),
                  title: Text(
                    'Account',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/account');
                  },
                ),
                ListTile(
                  leading: Icon(
                    CupertinoIcons.chart_bar_alt_fill,
                    color: Colors.black,
                  ),
                  title: Text(
                    'Charts',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/ViewChart');
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.notifications,
                    color: Colors.black,
                  ),
                  title: Text(
                    'Notifications',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/notification');
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.settings,
                    color: Colors.black,
                  ),
                  title: Text(
                    'Settings',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/setting');
                  },
                ),
                ListTile(
                  leading: Icon(
                    CupertinoIcons.share,
                    color: Colors.black,
                  ),
                  title: Text(
                    'Share with friends',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    CupertinoIcons.star_fill,
                    color: Colors.black,
                  ),
                  title: Text(
                    'Rate the app',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.arrow_2_circlepath,
              color: Colors.black,
              size: 20,
            ),
            title: Text(
              date,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
