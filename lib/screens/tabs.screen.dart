import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';
import './favorites.screen.dart';
import './Categories.screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, Object>> _pages = [
    {'page': CategoriesScreen(), 'title': "Categories"},
    {"page": FavoritesScreen(), "title": "Fav"}
  ];
  int _selectedPageIndex = 0;
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return //Scaffold(appBar: AppBar(title: Text("Tabs"),),);
        Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
        //bottom:
      ),
      drawer: MainDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        //selectedIconTheme: ,
        selectedItemColor: Theme.of(context).accentColor,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,

        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            title: Text("Categories"),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            title: Text("Fav"),
          ),
        ],
      ),
      body: _pages[_selectedPageIndex]["page"],
    );
  }
}
