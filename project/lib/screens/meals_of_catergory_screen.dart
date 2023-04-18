import 'package:flutter/material.dart';
import '../data/dummy_data.dart';
import '../widgets/meal_item.dart';
import '../models/meal.dart';
import '../screens/filters-screen.dart';

class MealsOfCategoryScreen extends StatefulWidget {
  static const routeName = '/meals-of-category';
  @override
  State<MealsOfCategoryScreen> createState() => _MealsOfCategoryScreenState();
}

class _MealsOfCategoryScreenState extends State<MealsOfCategoryScreen> {
  late String categoryTitle; //требует добавить Late
  late List<Meal> displayedMeals; //требует добавить Late
  //var _loadedInitData = false;
  late bool _vegetarianFilter;

  @override
  void initState() {
    Navigator.of(context)
        .pushNamed(
          FiltersScreen.routeName,
        )
        .then((value) => _vegetarianFilter = value as bool);

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

    if (_vegetarianFilter == true) {
      displayedMeals = dummyMeals.where(
        (meal) {
          return meal.categories.contains(categoryId) &&
              meal.isVegetarian ==
                  true; //создаем список с отфильтрованными Meals по категориям
        },
      ).toList();

      super.didChangeDependencies();
    }
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
