import 'package:flutter/material.dart';
import 'package:foodcatalogue/model/Food.dart';
import 'package:foodcatalogue/screen/FoodRecipeScreen.dart';

class FoodAdapter extends StatelessWidget {
  final Food food;

  FoodAdapter(this.food,);

  String get complexity {
    switch (food.complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Medium:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
        return '-';
    }
  }

  String get affordability {
    switch (food.affordability) {
      case Affordability.Cheap:
        return 'Cheap';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      case Affordability.Expensive:
        return 'Expensive';
        break;
      default:
        return '-';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectedFood(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 2,
        margin: EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                    food.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 16,
                  right: 8,
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: Text(
                      food.title,
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.schedule),
                      SizedBox(width: 8),
                      Text('${food.duration} min'),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.work),
                      SizedBox(width: 8),
                      Text(complexity)
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.attach_money),
                      SizedBox(width: 8),
                      Text(affordability),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void selectedFood(BuildContext context) {
    Navigator.of(context)
        .pushNamed(
      FoodRecipeScreen.routeName,
      arguments: food,
    );
  }
}
