import 'package:flutter/material.dart';
import 'package:foodcatalogue/model/Food.dart';
import 'package:foodcatalogue/navigation/NavigationDrawer.dart';
import 'package:foodcatalogue/screen/CategoryScreen.dart';
import 'package:foodcatalogue/screen/FavoriteScreen.dart';

class TabScreen extends StatefulWidget {
  final List<Food> favorite;

  TabScreen(this.favorite);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List<Map<String, Object>> _screens;

  int _selectedIndex = 0;

  @override
  void initState() {
    _screens = [
      {
        'page': CategoryScreen(),
        'title': 'Categories',
      },
      {
        'page': FavoriteScreen(widget.favorite),
        'title': 'Favotite',
      },
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screens[_selectedIndex]['title']),
      ),
      drawer: NavigationDrawer(),
      body: _screens[_selectedIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedScreen,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.amberAccent,
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text('Favorite'),
          ),
        ],
      ),
    );
  }

  void _selectedScreen(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
