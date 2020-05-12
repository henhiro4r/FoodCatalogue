import 'package:flutter/material.dart';

class CategoryFoodsScreen extends StatelessWidget {

  final String categoryId;
  final String categoryTitle;

  CategoryFoodsScreen(this.categoryId, this.categoryTitle);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Center(
        child: Text('Recipes For The Category'),
      ),
    );
  }
}
