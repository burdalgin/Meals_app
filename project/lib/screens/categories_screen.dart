import 'package:flutter/material.dart';
import 'package:project/data/dummy_data.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  //const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //ВАЖНО! Если экран используется в TabsScreen, то Scaffold не нужен!
    return GridView(
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
    );
  }
}
