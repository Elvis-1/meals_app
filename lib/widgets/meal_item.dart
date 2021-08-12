import 'package:flutter/material.dart';

class MealItem extends StatelessWidget {
  //const MealItem({Key? key}) : super(key: key);
 void selectMeal(){}
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: selectMeal,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
      ),

    );
  }
}
