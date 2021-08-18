import 'package:flutter/material.dart';
import './dummy_data.dart';
import './models/meal.dart';
import './screens/filter_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/tabs_screen.dart';
import './screens/category_meals_screen.dart';




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
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeal = [];

  void _setFilters (Map<String, bool> filterData){
   setState((){
     _filters = filterData;
     _availableMeals = DUMMY_MEALS.where((meal) {
         if(_filters['gluten']  == true && meal.isGlutenFree == false){
           return false;
         }
         if(_filters['lactose'] == true && meal.isLactoseFree == false){
           return false;
         }
         if(_filters['vegan'] == true && meal.isVegan == false){
           return false;
         }
         if(_filters['vegetarian']== true && meal.isVegetarian == false){
           return false;
         }
         return true;
     }).toList();
   });

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
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName : (ctx) => MealDetailScreen(),
        FiltersScreen.routeName :(ctx) => FiltersScreen(_filters,_setFilters)
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
        return MaterialPageRoute<dynamic>(builder: (ctx)=> CategoryMealsScreen(_availableMeals));
      },
    );
  }
}

