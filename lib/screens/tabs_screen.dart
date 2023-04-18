// import 'chat_screen.dart';
// import 'package:flutter/material.dart';
// import 'grocery_screen.dart';
// import 'recipe_with_pie_chart.dart';
// import '../models/meal.dart';
// import '../screens/categories_screen.dart';
// import '../screens/favourites_screen.dart';
// import '../widgets/main_drawer.dart';

// class TabsScreen extends StatefulWidget {
//   final List<Meal> favouriteMeals;
//   TabsScreen({required this.favouriteMeals});
//   @override
//   State<TabsScreen> createState() => _TabsScreenState();
// }

// class _TabsScreenState extends State<TabsScreen> {
//   List<Map<String, Object>> _pages = [];
//   int _selectedPageIndex = 0;
//   void _selectPage(int index) {
//     setState(() {
//       _selectedPageIndex = index;
//     });
//   }

//   void initState() {
//     _pages = [
//       // {
//       //   'page': CategoriesScreen(),
//       //   'title': 'Categories',
//       // },
//       {
//         'page': Recipes_with_pie_chart_screen(),
//         'title': 'Dont display this in app bar',
//       },
//       {
//         'page': ChatScreen(),
//         'title': 'Recipe Guru',
//       },

//       {
//         'page': GroceryScreen(),
//         'title': 'My Grocery List',
//       }
//     ];
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: _selectedPageIndex == 0 || _selectedPageIndex == 1
//           ? null
//           : AppBar(
//               title: Text(_pages[_selectedPageIndex]['title'] as String),
//             ),
//       drawer: MainDrawer(),
//       body: _pages[_selectedPageIndex]['page'] as Widget,
//       bottomNavigationBar: BottomNavigationBar(
//         onTap: _selectPage,
//         backgroundColor: Theme.of(context).primaryColor,
//         unselectedItemColor: Colors.white,
//         selectedItemColor: Theme.of(context).accentColor,
//         currentIndex: _selectedPageIndex,
//         items: [
//           // BottomNavigationBarItem(
//           //   icon: Icon(Icons.category),
//           //   label: 'Cat',
//           // ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.local_dining),
//             label: 'Recipes',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.star),
//             label: 'Fav',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.shopping_cart),
//             label: 'Gro',
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:chatgpt_course/screens/nav_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/models_provider.dart';
import 'chat_screen.dart';
import 'grocery_screen.dart';
import 'recipe_with_pie_chart.dart';

import '../models/meal.dart';
import '../screens/categories_screen.dart';
import '../screens/favourites_screen.dart';
import '../widgets/main_drawer.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

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
                title: Text(_pages[_selectedPageIndex]['title'] as String),
              ),
        drawer: MainDrawer(),
        body: _pages[_selectedPageIndex]['page'] as Widget,
        bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.black,
          selectedItemColor: Theme.of(context).accentColor,
          currentIndex: _selectedPageIndex,
          type: BottomNavigationBarType.shifting,
          // fixedColor: Colors.amber, // added this line
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
              icon: Icon(Icons.shopping_cart),
              activeIcon: Icon(
                Icons.shopping_cart,
              ),
              label: 'My Groceries',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.play_circle_filled),
              activeIcon: Icon(
                Icons.play_circle_filled,
              ),
              label: 'youtube',
            ),
          ],
        ),
      ),
    );
  }
}