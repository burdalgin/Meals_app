import 'package:flutter/material.dart';

class MealDescriptionScreen extends StatelessWidget {
  //const MealDescriptionScreen({super.key});
  static const routeName = '/meal-description';

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(title: Text('Meal $mealId')),
      body: Center(
        child: Text('Meal - $mealId'),
      ),
    );
  }
}
