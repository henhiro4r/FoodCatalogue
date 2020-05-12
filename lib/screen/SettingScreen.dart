import 'package:flutter/material.dart';
import 'package:foodcatalogue/navigation/NavigationDrawer.dart';

class SettingScreen extends StatelessWidget {
  static const routeName = '/setting';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setting'),
      ),
      drawer: NavigationDrawer(),
      body: Center(
        child: Text('AAA'),
      ),
    );
  }
}
