import 'package:flutter/material.dart';
import 'package:project/dummy_data.dart';
import './category_item.dart';

class CategoriesScreen extends StatelessWidget {
  //const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DeliMeal'),
      ),
      body: GridView(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 300,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10, //расстояние между элементами в сетке
          mainAxisSpacing: 10, //расстояние между элементами в сетке
        ),
        children: dummyCategories
            .map((catData) => CategoryItem(
                  catData.id,
                  catData.title,
                  catData.color,
                ))
            .toList(), //каждому елементу в CategoryItem назначаем соответствующие значение из набора данных dummy_categories
      ),
    );
  }
}
