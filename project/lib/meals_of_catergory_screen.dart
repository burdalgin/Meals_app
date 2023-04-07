import 'package:flutter/material.dart';

class MealsOfCategoryScreen extends StatelessWidget {
  //const MealsOfCategoryScreen({super.key});

  final String categoryId;
  final String categoryTitle;

  MealsOfCategoryScreen(this.categoryId, this.categoryTitle);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Center(
        child: Text(categoryTitle),
      ),
    );
  }
}
