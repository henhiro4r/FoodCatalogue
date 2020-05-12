import 'package:flutter/material.dart';
import 'package:foodcatalogue/adapter/FoodAdapter.dart';
import 'package:foodcatalogue/model/Food.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Food> favorite;

  FavoriteScreen(this.favorite);

  @override
  Widget build(BuildContext context) {
    if (favorite.isEmpty) {
      return Center(
        child: Text('No Favorite Food!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return FoodAdapter(favorite[index],);
        },
        itemCount: favorite.length,
      );
    }
  }
}
