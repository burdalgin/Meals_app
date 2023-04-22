import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> listOffavoriteMeals;
  // final Function remoneFromFavorites;
  // final Function addFavorite;

  FavoritesScreen(this.listOffavoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (listOffavoriteMeals.isEmpty) {
      return Center(
        child: Text("There no favorite meals"),
      );
    } else {
      return ListView.builder(
        itemBuilder: ((context, index) {
          return MealItem(
            id: listOffavoriteMeals[index].id,
            title: listOffavoriteMeals[index].title,
            affordability: listOffavoriteMeals[index].affordability,
            complexity: listOffavoriteMeals[index].complexity,
            duration: listOffavoriteMeals[index].duration,
            imageUrl: listOffavoriteMeals[index].imageUrl,
          );
        }),
        itemCount: listOffavoriteMeals.length,
      );
    }
  }
}
