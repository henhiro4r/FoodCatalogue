import 'package:flutter/material.dart';
import 'package:foodcatalogue/screen/SettingScreen.dart';

class NavigationDrawer extends StatelessWidget {

  Widget listTile(String title, IconData icon, Function destination) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: destination,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(29),
            alignment: Alignment.centerLeft,
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          listTile('Meals', Icons.restaurant, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          listTile('Settings', Icons.settings, () {
            Navigator.of(context).pushReplacementNamed(SettingScreen.routeName);
          }),
        ],
      ),
    );
  }
}
