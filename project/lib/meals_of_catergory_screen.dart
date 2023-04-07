import 'package:flutter/material.dart';

class MealsOfCategoryScreen extends StatelessWidget {
  static const routeName = '/meals-of-category'; //создаем адрес экрана для

  @override
  Widget build(BuildContext context) {
    final routeArguments = ModalRoute.of(context)!.settings.arguments as Map<
        String,
        String>; //из Route /meals-of-category' достаем данные и распределяем в Map
    final categoryTitle = routeArguments['title']; //достаем из Map значение
    final categoryId = routeArguments['id']; //достаем из Map значение

    return Scaffold(
      appBar: AppBar(
        title: Text(
            categoryTitle!), // используется проверка на non null используется ! в конце
      ),
      body: Center(
        child: Text(categoryTitle),
      ),
    );
  }
}
