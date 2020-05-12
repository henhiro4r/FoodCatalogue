import 'package:flutter/material.dart';
import 'package:foodcatalogue/model/Category.dart';
import 'package:foodcatalogue/screen/CategoryFoodsScreen.dart';

class CategoryAdapter extends StatelessWidget {
  final Category category;

  CategoryAdapter(this.category);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.title,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              category.bgColor.withOpacity(0.7),
              category.bgColor,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }

  void selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(
      CategoryFoodsScreen.routeName,
      arguments: category,
    );
  }
}
