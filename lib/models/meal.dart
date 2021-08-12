import 'package:flutter/foundation.dart';

enum Complexity {
  Simple,
  Challenging,
  Hard
}

enum Affordability{
  Affaordable,
  Pricey,
  Luxurious
}

class Meals{
  final String id;
  final List<String> category;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;
}

Meals({@required this.id, @required this.category, });