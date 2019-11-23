import 'package:flutter/material.dart';
import '../screens/Categories.screen.dart';
//import './Category_meals.screen.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;
  final String id;

  CategoryItem(this.id, this.title, this.color);

  void _selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(
        // MaterialPageRoute(builder: (_) {
        //   return CategoryMeals(
        //     categoryId: id,
        //     categoryTitle: title,
        //   );
        // }),
        CategoriesScreen.categoryMealRoute,
        arguments: {'id': id, 'title': title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      onTap: () {
        _selectCategory(context);
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(title, style: Theme.of(context).textTheme.title),
        //color: color,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            color.withOpacity(0.7),
            color,
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
