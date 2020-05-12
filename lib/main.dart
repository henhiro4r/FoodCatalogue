import 'package:flutter/material.dart';
import 'package:foodcatalogue/model/DummyFood.dart';
import 'package:foodcatalogue/model/Food.dart';
import 'package:foodcatalogue/screen/CategoryFoodsScreen.dart';
import 'package:foodcatalogue/screen/CategoryScreen.dart';
import 'package:foodcatalogue/screen/FoodRecipeScreen.dart';
import 'package:foodcatalogue/screen/SettingScreen.dart';
import 'package:foodcatalogue/screen/TabScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _preference = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Food> _filteredFood = DUMMY_MEALS;

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
        '/': (ctx) => TabScreen(),
        CategoryFoodsScreen.routeName: (ctx) => CategoryFoodsScreen(_filteredFood),
        FoodRecipeScreen.routeName: (ctx) => FoodRecipeScreen(),
        SettingScreen.routeName: (ctx) => SettingScreen(_preference, _setPref),
      },
      onUnknownRoute: (settings) {
        // for 404 page
        return MaterialPageRoute(builder: (ctx) => CategoryScreen());
      },
    );
  }

  void _setPref(Map<String, bool> pref) {
    setState(() {
      _preference = pref;
      _filteredFood = DUMMY_MEALS.where((meal) {
        if (_preference['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_preference['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_preference['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_preference['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }
}
