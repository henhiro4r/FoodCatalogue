import 'package:flutter/material.dart';
import 'package:foodcatalogue/screen/CategoryScreen.dart';
import 'package:foodcatalogue/screen/FavoriteScreen.dart';

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Foods'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(icon: Icon(Icons.category), text: 'Categories'),
              Tab(icon: Icon(Icons.star), text: 'Favorite'),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            CategoryScreen(),
            FavoriteScreen(),
          ],
        ),
      ),
    );
  }
}
