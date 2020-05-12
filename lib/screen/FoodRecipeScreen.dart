import 'package:flutter/material.dart';
import 'package:foodcatalogue/model/Food.dart';

class FoodRecipeScreen extends StatelessWidget {
  static const routeName = '/foods-recipe';

  Widget sectionTitle(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16),
      child: Text(
        title,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  Widget sectionContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(8),
      height: 250,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final food = ModalRoute.of(context).settings.arguments as Food;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          food.title,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 16),
              height: 300,
              width: double.infinity,
              child: Image.network(food.imageUrl),
            ),
            sectionTitle(context, 'Ingredients'),
            sectionContainer(
              ListView.builder(
                itemBuilder: (cts, index) => Card(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(food.ingredients[index]),
                  ),
                ),
                itemCount: food.ingredients.length,
              ),
            ),
            sectionTitle(context, 'Steps'),
            sectionContainer(ListView.builder(
              itemBuilder: (ctx, index) => Column(
                children: <Widget>[
                  ListTile(
                    leading: CircleAvatar(
                      child: Text('#${(index + 1)}'),
                    ),
                    title: Text(food.steps[index]),
                  ),
                  Divider(),
                ],
              ),
              itemCount: food.steps.length,
            )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        onPressed: () => Navigator.of(context).pop(food),
      ),
    );
  }
}
