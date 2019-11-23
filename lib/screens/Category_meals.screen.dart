import 'package:flutter/material.dart';
import 'package:meals/widgets/meal_item.dart';
import '../models/meal.dart';
import '../dummy-data.dart';

class CategoryMealsScreen extends StatefulWidget {
  // final String categoryId;
  // final String categoryTitle;

  // const CategoryMeals({this.categoryId, this.categoryTitle});

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  List<Meal> categoryMeals;
  Map<String, String> routeArgs;
  bool _loadedInitData = false;

  @override
  void initState() {
    super.initState();

    // super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;

      categoryMeals = DUMMY_MEALS.where((meal) {
        return meal.categories.contains(routeArgs['id']);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal(Meal removemeal) {
    setState(() {
      categoryMeals.removeWhere((meal) => meal.id == removemeal.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(routeArgs['title']),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(categoryMeals[index], _removeMeal);
          },
          itemCount: categoryMeals.length,
        ),
      ),
    );
  }
}
