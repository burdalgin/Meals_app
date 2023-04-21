import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../models/meal.dart';

class MealsOfCategoryScreen extends StatefulWidget {
  static const routeName = '/meals-of-category';

  final List<Meal> filteredMeals;

  MealsOfCategoryScreen(this.filteredMeals);

  @override
  State<MealsOfCategoryScreen> createState() => _MealsOfCategoryScreenState();
}

class _MealsOfCategoryScreenState extends State<MealsOfCategoryScreen> {
  late String categoryTitle; //требует добавить Late
  late List<Meal> displayedMeals; //требует добавить Late
  //var _loadedInitData = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    //  if (_loadedInitData == false) {
    final routeArguments = ModalRoute.of(context)!.settings.arguments as Map<
        String,
        String>; //из Route /meals-of-category' достаем данные и распределяем в Map
    categoryTitle = routeArguments['title'] as String; //достаем из Map значение
    final categoryId = routeArguments['id']; //достаем из Map знач

    displayedMeals = widget.filteredMeals.where(
      (meal) {
        return meal.categories.contains(categoryId);
      },
    ).toList();

    super.didChangeDependencies();
  }

  void _popRemoveMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((element) =>
          element.id ==
          mealId); //создание списка после удаления просмотренного элемента по кнопке из MealDescriptionScreen
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayedMeals[index].id,
            title: displayedMeals[index].title,
            imageUrl: displayedMeals[index].imageUrl,
            duration: displayedMeals[index].duration,
            complexity: displayedMeals[index].complexity,
            affordability: displayedMeals[index].affordability,
            removeItemCallBack: _popRemoveMeal,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
