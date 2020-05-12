import 'package:flutter/material.dart';
import 'package:foodcatalogue/adapter/CategoryAdapter.dart';
import 'package:foodcatalogue/model/DummyCategory.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food Catalogue'),
      ),
      body: GridView(
        padding: const EdgeInsets.all(16),
        children: DUMMY_CATEGORIES
            .map(
              (data) => CategoryAdapter(
                data,
              ),
            )
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),
    );
  }
}
