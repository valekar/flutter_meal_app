import 'package:flutter/material.dart';
import 'package:meals/screens/filters.screen.dart';
import 'package:meals/screens/tabs.screen.dart';
import './screens/meal_detail.screen.dart';
import './screens/Category_meals.screen.dart';
import './screens/Categories.screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Desi Meals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              body2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              title: TextStyle(
                  fontFamily: 'RobotoCondensed',
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
      ),
      //home: CategoriesScreen(),
      initialRoute: "/",
      routes: {
        '/': (ctx) => TabsScreen(),
        CategoriesScreen.categoryMealRoute: (ctx) => CategoryMealsScreen(),
        CategoriesScreen.mealDetailRoute: (ctx) => MealDetailsScreen(),
        FiltersScreen.routeName: (ctx) => FiltersScreen()
      },
      // onGenerateRoute: (settings) {
      //   return MaterialPageRoute(
      //     builder: (ctx) => CategoriesScreen(),
      //   );
      // },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (ctx) {
            return CategoriesScreen();
          },
        );
      },
    );
  }
}
