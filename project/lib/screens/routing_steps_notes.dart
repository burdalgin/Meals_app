/*1. Создать виджет страницы
2. В классе виджета страницы определить путь к странице static const (static const routeName = '/meal-description';)
3. В main зарегистрировать страницу 
 initialRoute: '/', //устанавливаем значение домашней страницы
      routes: {
        '/': (ctx) => CategoriesScreen(), //устанавливаем домашнюю страницу
        //это MAP поэтому в {}
        MealsOfCategoryScreen.routeName: (ctx) => MealsOfCategoryScreen(),
        MealDescriptionScreen.routeName:(ctx) => MealDescriptionScreen(),

      },

4. В виджете источнике onTap создаем функцию рутинга с передачей аргументов

 void selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(MealDescriptionScreen.routeName, arguments: {
      id,} );
  }

  5. В виджете страницы принимаем переданные arguments

   Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments; }

    6. На странице исходнике назначаем onTap: () => selectMeal(context),*/