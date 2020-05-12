import 'package:flutter/material.dart';
import 'package:foodcatalogue/adapter/FoodAdapter.dart';
import 'package:foodcatalogue/model/Category.dart';
import 'package:foodcatalogue/model/DummyFood.dart';

class CategoryFoodsScreen extends StatelessWidget {
  static const routeName = '/foods';

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context).settings.arguments as Category;
    final categoryFood = DUMMY_MEALS.where((food) {
      return food.categories.contains(category.id);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return FoodAdapter(
            categoryFood[index],
          );
        },
        itemCount: categoryFood.length,
      ),
    );
  }
}
