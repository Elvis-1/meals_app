import 'package:flutter/material.dart';
import 'package:meals_app/screens/favorites_screen.dart';

import './categories_screen.dart';
import '../models/meal.dart';
import '../widgets/main_drawer.dart';


class TabsScreen extends StatefulWidget {
// final List<Meal> favoriteMeals;
    // TabsScreen(this.favoriteMeals);
TabsScreen();
  //const TabsScreen({Key? key}) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

//   final List<Map<String, Object>> _pages = [
//     { 'page': CategoriesScreen(), 'title': 'Categories'},
//     {'page' : FavoritesScreen(), 'title': 'Your Favorite'}
// ];

  final List<Widget> _pages = [
    CategoriesScreen(),
    // FavoritesScreen(widget.favoriteMeals)
    FavoritesScreen()
  ];

  int _selectedPageIndex = 0;
  void _selectPage(int index){
 setState(() {
   _selectedPageIndex = index;
 });
  }
  @override
  // Widget build(BuildContext context) {
  //   return DefaultTabController(length: 2,
  //       // initialIndex: 0,
  //       child: Scaffold(
  //     appBar: AppBar(
  //       title: Text('Meals'),
  //       bottom: TabBar(
  //         tabs: [
  //           Tab(icon: Icon(Icons.category),
  //           text: 'Category',
  //           ),
  //           Tab(icon: Icon(Icons.star),
  //           text: 'Favorite',)
  //         ],
  //       ),
  //     ),
  //         body: TabBarView(
  //           children: [
  //             CategoriesScreen(),
  //             FavoritesScreen(),
  //           ],
  //         ),
  //   ),
  //   );

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
         title: Text('Meals'),
        ),
        // drawer: Drawer(child: Text('This is drawer'),),
      drawer: MainDrawer(),
        body: _pages[_selectedPageIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).accentColor,
          currentIndex: _selectedPageIndex,
          type: BottomNavigationBarType.shifting,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category),
              title: Text('Categories'),),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.star),
              title: Text('Favorites'),),
          ],
        ),
      );
  }
}
