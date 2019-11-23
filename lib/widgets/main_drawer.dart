import 'package:flutter/material.dart';
import 'package:meals/screens/filters.screen.dart';

class MainDrawer extends StatelessWidget {
  Widget _buildLisTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              "Cook",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                color: Theme.of(context).primaryColor,
                fontSize: 30,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          _buildLisTile("Desi Meals", Icons.restaurant, () {
            Navigator.of(context).pushReplacementNamed("/");
          }),
          _buildLisTile(
            "Filters",
            Icons.filter,
            () {
              Navigator.of(context)
                  .pushReplacementNamed(FiltersScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
