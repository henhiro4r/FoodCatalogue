import 'package:flutter/material.dart';
import 'package:foodcatalogue/screen/CategoryFoodsScreen.dart';
import 'package:foodcatalogue/screen/CategoryScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Catalogue',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        accentColor: Colors.deepOrangeAccent,
        canvasColor: Colors.white,
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              body2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              title: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
//      home: CategoryScreen(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => CategoryScreen(),
        CategoryFoodsScreen.routeName: (ctx) => CategoryFoodsScreen(),
      },
    );
  }
}
