import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/models_provider.dart';
import 'chat_screen.dart';
import 'drawer.dart';
import 'grocery_screen.dart';
import 'recipe_with_pie_chart.dart';
import '../models/meal.dart';
import '../screens/categories_screen.dart';
import '../screens/favourites_screen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../screens/nav_screen.dart';
import 'add_recipe_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages = [];
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void initState() {
    _pages = [
      {
        'page': MyFlipCard(),
        'title': 'Dont display this in app bar',
      },
      {
        'page': ChatScreen(),
        'title': 'Recipe Sage',
      },
      {
        'page': CreateRecipeScreen(),
        'title': 'Add recipe',
      },
      {
        'page': GroceryScreen(),
        'title': 'My Groceries',
      },
      {
        'page': NavScreen(),
        'title': 'Youtube screen',
      }
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ModelsProvider()),
      ],
      child: Scaffold(
        appBar: _selectedPageIndex == 0 || _selectedPageIndex == 1
            ? null
            : AppBar(
              backgroundColor: Colors.amber,
                title: Text(_pages[_selectedPageIndex]['title'] as String),
              ),
        drawer: MyDrawer(),
        body: _pages[_selectedPageIndex]['page'] as Widget,
        bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          backgroundColor: Colors.amber,
          unselectedItemColor: Colors.black,
          selectedItemColor: Colors.amber,
          currentIndex: _selectedPageIndex,
          type: BottomNavigationBarType.shifting,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.local_dining),
              activeIcon: Icon(
                Icons.local_dining,
              ),
              label: 'Recipes',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              activeIcon: Icon(
                Icons.star,
              ),
              label: 'Recipe Sage',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outline),
              activeIcon: Icon(
                Icons.add_circle_outline,
              ),
              label: 'Add recipe',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              activeIcon: Icon(
                Icons.shopping_cart,
              ),
              label: 'Groceries',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.video_collection_outlined),
              activeIcon: Icon(
                Icons.video_collection_outlined,
              ),
              label: 'Youtube',
            ),
          ],
        ),
      ),
    );
  }
}
