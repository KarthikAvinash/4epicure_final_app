// import 'package:flutter/material.dart';
// import '../screens/recipe_detail_screen.dart';
// import './dummy_data.dart';
// import './models/meal.dart';
// import './screens/filters_screen.dart';
// import './screens/meal_detail_screen.dart';
// import './screens/tabs_screen.dart';
// import './screens/category_meals_screen.dart';
// import './screens/categories_screen.dart';
// import 'globals.dart';
// void main() => runApp(MyApp());

// class MyApp extends StatefulWidget {
//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   Map<String, bool> _filters = {
//     'gluten': false,
//     'lactose': false,
//     'vegan': false,
//     'vegeterian': false,
//   };
//   List<Meal> _availableMeals = DUMMY_MEALS;
//   List<Meal> _favouritMeals = [];
//   void _setFilters(Map<String, bool> filterData) {
//     setState(() {
//       _filters = filterData;
//       _availableMeals = DUMMY_MEALS.where((meal) {
//         if (_filters['gluten']! && !meal.isGlutenFree) {
//           return false;
//         }
//         if (_filters['lactose']! && !meal.isLactoseFree) {
//           return false;
//         }
//         if (_filters['vegeterian']! && !meal.isVegetarian) {
//           return false;
//         }
//         if (_filters['vegan']! && !meal.isVegan) {
//           return false;
//         }
//         return true;
//       }).toList();
//     });
//   }

//   void _toggleFavourite(String mealId) {
//     final existingIndex =
//         _favouritMeals.indexWhere((meal) => meal.id == mealId);
//     if (existingIndex >= 0) {
//       setState(() {
//         _favouritMeals.removeAt(existingIndex);
//       });
//     } else {
//       setState(() {
//         _favouritMeals.add(
//           DUMMY_MEALS.firstWhere((meal) => meal.id == mealId),
//         );
//       });
//     }
//   }

//   bool _isMealFavourite(String id) {
//     return _favouritMeals.any((meal) => meal.id == id);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'DeliMeals',
//       theme: ThemeData(
//         primarySwatch: Colors.pink,
//         accentColor: Colors.amber,
//         canvasColor: Color.fromRGBO(255, 254, 229, 1),
//         fontFamily: 'Raleway',
//       ),
//       initialRoute: '/',
//       routes: {
//         '/': (ctx) => TabsScreen(),
//         CategoryMealsScreen.routeName: (ctx) =>
//             CategoryMealsScreen(_availableMeals),
//         FilterScreen.routeName: (c) => FilterScreen(_filters, _setFilters),
//         RecipePage.routeName: (ctx) => RecipePage(
//               recipeName: (ModalRoute.of(ctx)!.settings.arguments
//                   as Map<String, dynamic>)['recipeName'],
//               description: (ModalRoute.of(ctx)!.settings.arguments
//                   as Map<String, dynamic>)['description'],
//               ingredientsWithQty: (ModalRoute.of(ctx)!.settings.arguments
//                   as Map<String, dynamic>)['ingredientsWithQty'],
//               recipeImage: (ModalRoute.of(ctx)!.settings.arguments
//                   as Map<String, dynamic>)['recipeImage'],
//               recipeSteps: (ModalRoute.of(ctx)!.settings.arguments
//                   as Map<String, dynamic>)['recipeSteps'],
//             ),
//       },
//       onUnknownRoute: (settings) {
//         return MaterialPageRoute(
//           builder: (ctx) =>  TabsScreen(),
//         );
//       },
//     );
//   }
// }

//_____________________________________THIS________________________
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import './screens/tabs_screen.dart';
// import './providers/chats_provider.dart';
// import './providers/models_provider.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider(
//           create: (_) => ChatProvider(),
//         ),
//         ChangeNotifierProvider(
//           create: (_) => ModelsProvider(),
//         ),
//       ],
//       child: MaterialApp(
//         title: 'Recipe And Meals',
//         debugShowCheckedModeBanner: false,
//       //   theme: ThemeData(
//       //   primarySwatch: Colors.pink,
//       //   accentColor: Colors.amber,
//       //   canvasColor: Color.fromRGBO(255, 254, 229, 1),
//       //   fontFamily: 'Raleway',
//       // ),
//         home: TabsScreen(),
//       ),
//     );
//   }
// }

// //________________________________________OR THIS_________________
// import 'package:chatgpt_course/screens/tabs_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import '../screens/nav_screen.dart';

// void main() {
//   runApp(const ProviderScope(child: MyApp()));
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
//     return MaterialApp(
//       title: "My Youtube App",
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         brightness: Brightness.dark,
//         bottomNavigationBarTheme: const BottomNavigationBarThemeData(
//           selectedItemColor: Colors.white,
//         ),
//       ),
//       home: TabsScreen(),
//     );
//   }
// }
import 'package:chatgpt_course/auth_screens/signIn.dart';
import 'package:chatgpt_course/auth_screens/signUp.dart';
import 'package:chatgpt_course/screens/about_us_screen.dart';
import 'package:chatgpt_course/screens/grocery_screen.dart';
import 'package:chatgpt_course/screens/recipe_with_pie_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' as riverpod;
import 'package:provider/provider.dart';
import 'package:provider/provider.dart' as provider;
import './screens/tabs_screen.dart';
import './providers/chats_provider.dart';
import './providers/models_provider.dart';
import 'main_splash.dart';
import 'package:chatgpt_course/screens/get_nutrients_screen.dart';

void main() {
  runApp(
    riverpod.ProviderScope(
      child: MultiProvider(
        providers: [
          provider.ChangeNotifierProvider(
            create: (_) => ChatProvider(),
          ),
          provider.ChangeNotifierProvider(
            create: (_) => ModelsProvider(),
          ),
        ],
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      title: 'Recipe And Meals',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: Colors.white,
        ),
      ),
      // home:const SignupScreen(),
      home: SplashScreen(),
      // home: ShakeToNavigate(),
      // home:getNutrientsScreen(),
      // home: AboutUsScreen(),
    );
  }
}
