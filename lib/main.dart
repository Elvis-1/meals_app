import 'package:flutter/material.dart';
import 'package:meals_app/screens/filter_screen.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';
import './screens/tabs_screen.dart';
import 'screens/category_meals_screen.dart';
import 'screens/categories_screen.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten' : false,
    'lactose': false,
    'vegan':false,
    'vegetarian': false
  };
  void _setFilters (Map<String, bool> filterData){
   setState((){
     _filters = filterData;
   })

  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nigeria Meals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
           body1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1),),
            body2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1),),
            title: TextStyle(fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: 'RobotoCondensed',
            ),
      ),
      ),
      // home: CategoriesScreen(),
      routes: {
        '/' : (ctx) => TabsScreen(),
        // '/' : (ctx) => CategoriesScreen(),
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),
        MealDetailScreen.routeName : (ctx) => MealDetailScreen(),
        FiltersScreen.routeName :(ctx) => FiltersScreen(_setFilters)
      },
      // onGenerateRoute: use it when a particular route is not available
      // onGenerateRoute: (settings){
      //   print(settings.arguments);
      //   if(settings.name == '/meal-detail'){
      //     return MaterialPageRoute<dynamic>(builder: (ctx)=> MealDetailScreen());
      //   }else if ( settings.name == '/something'){
      //     return MaterialPageRoute<dynamic>(builder: (ctx)=> MealDetailScreen());
      //   }
      // },
      // onUnknownRoute -- use it as a fallback when all route fails
      onUnknownRoute: (settings){
        return MaterialPageRoute<dynamic>(builder: (ctx)=> CategoryMealsScreen());
      },
    );
  }
}

