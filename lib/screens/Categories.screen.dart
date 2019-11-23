import 'package:flutter/material.dart';
import '../widgets/Category_item.dart';
import 'package:meals/dummy-data.dart';
import '../dummy-data.dart';

class CategoriesScreen extends StatelessWidget {
  static const String categoryMealRoute = 'category-meals';
  static const String mealDetailRoute = "category-meals/meal";

  @override
  Widget build(BuildContext context) {
    return GridView(
      children: DUMMY_CATEGORIES.map((cartData) {
        return CategoryItem(cartData.id, cartData.title, cartData.color);
      }).toList(),
      padding: const EdgeInsets.all(25),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
    );
  }
}
