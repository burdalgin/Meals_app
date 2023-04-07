import 'package:flutter/material.dart';
import './meals_of_catergory_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  const CategoryItem(
    this.id,
    this.title,
    this.color,
  );

  void selectCategory(
      BuildContext
          ctx) //Создаем контекст. Наименование аргумента должно отличаться от context
  {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
      return MealsOfCategoryScreen(id, title);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      //Тоже самое что и GestureDetector только с эффектами
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(5),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withOpacity(0.7), color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
