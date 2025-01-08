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
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary),
                accountName: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Text(
                    '${name}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                accountEmail: Text(
                  'Balance: ${amountBalance}',
                  style: TextStyle(fontSize: 14),
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('images/img6.jpg'),
                ),
              )),
          ListTile(
            leading: Icon(
              CupertinoIcons.home,
              color: Colors.black,
            ),
            title: Text(
              'Home',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
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
              'rate the app',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),

        ],
      ),
    );
  }
}
