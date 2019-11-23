import 'package:flutter/material.dart';
import '../screens/Categories.screen.dart';
import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final Meal meal;
  final Function removeMeal;
  MealItem(this.meal, this.removeMeal);

  String get _complexityText {
    if (Complexity.Simple == meal.complexity) {
      return "Simple";
    }
    if (Complexity.Hard == meal.complexity) {
      return "Hard";
    }
    if (Complexity.Challenging == meal.complexity) {
      return "Challenging";
    }
  }

  String get _affordabilityText {
    String result;
    switch (meal.affordability) {
      case Affordability.Affordable:
        {
          result = "Affordable";
          break;
        }
      case Affordability.Luxurious:
        {
          result = "Luxurious";
          break;
        }
      case Affordability.Pricey:
        {
          result = "Pricey";
          break;
        }
      default:
        {
          result = "Unknown";
        }
    }

    return result;
  }

  void _selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(
      CategoriesScreen.mealDetailRoute,
      arguments: {'meal': meal},
    ).then((result) {
      removeMeal(result);
    });
  }

  @override
  Widget build(BuildContext context) {
    final duration = meal.duration;
    return InkWell(
      onTap: () {
        _selectMeal(context);
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(meal.imageUrl,
                      height: 250, width: double.infinity, fit: BoxFit.cover),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    child: Text(
                      meal.title,
                      style: TextStyle(
                          fontSize: Theme.of(context).textTheme.title.fontSize,
                          color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                    width: 320,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.schedule),
                      SizedBox(
                        width: 6,
                      ),
                      Text('$duration min'),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.work),
                      SizedBox(
                        width: 6,
                      ),
                      Text('$_complexityText'),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.attach_money),
                      SizedBox(
                        width: 6,
                      ),
                      Text('$_affordabilityText'),
                    ],
                  )
                ],
              ),
              padding: EdgeInsets.all(20),
            ),
          ],
        ),
      ),
    );
  }
}
