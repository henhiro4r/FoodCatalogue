import 'package:flutter/material.dart';
import 'package:foodcatalogue/adapter/FoodAdapter.dart';
import 'package:foodcatalogue/model/Category.dart';
import 'package:foodcatalogue/model/Food.dart';

class CategoryFoodsScreen extends StatefulWidget {
  static const routeName = '/foods';

  final List<Food> foods;

  CategoryFoodsScreen(this.foods);

  @override
  _CategoryFoodsScreenState createState() => _CategoryFoodsScreenState();
}

class _CategoryFoodsScreenState extends State<CategoryFoodsScreen> {

  Category category;
  List<Food> categoryFood;
  var _loaded = false;

  @override
  void initState() {

    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loaded){
      category = ModalRoute.of(context).settings.arguments as Category;
      categoryFood = widget.foods.where((food) {
        return food.categories.contains(category.id);
      }).toList();
      _loaded = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return FoodAdapter(categoryFood[index]);
        },
        itemCount: categoryFood.length,
      ),
    );
  }
}
