import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';

class MealDetailsScreen extends StatelessWidget {
  Widget _buildSelectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  Widget _buildContainer(BuildContext context, Widget widget) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white54,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 200,
      width: 300,
      child: widget,
    );
  }

  @override
  Widget build(BuildContext context) {
    final routeArg =
        ModalRoute.of(context).settings.arguments as Map<String, Meal>;
    final Meal meal = routeArg['meal'];
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            _buildSelectionTitle(context, "Ingredients"),
            _buildContainer(
              context,
              ListView.builder(
                itemCount: meal.ingredients.length,
                itemBuilder: (ctx, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 1, horizontal: 1),
                    child: Card(
                      color: Theme.of(context).accentColor,
                      child: Padding(
                        child: Text(meal.ingredients[index]),
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      ),
                    ),
                  );
                },
              ),
            ),
            _buildSelectionTitle(context, "Steps"),
            _buildContainer(
              context,
              ListView.builder(
                itemCount: meal.steps.length,
                itemBuilder: (ctx, index) => Column(
                  children: <Widget>[
                    ListTile(
                      leading: CircleAvatar(
                        child: Text(" # ${(index + 1)}"),
                      ),
                      title: Text(meal.steps[index]),
                    ),
                    Divider(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        onPressed: () {
          Navigator.of(context).pop(meal);
        },
      ),
    );
  }
}
