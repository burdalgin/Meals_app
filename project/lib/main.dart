import 'package:flutter/material.dart';
import 'package:project/models/meal.dart';

import 'screens/meals_of_catergory_screen.dart';
import 'screens/meal_desctription_screen.dart';
import 'screens/page_not_found_screen.dart';

import './screens/tabs_screen_bottom.dart';
import './screens/filters-screen.dart';
import './data/dummy_data.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegeterian': false,
  };

  List<Meal> _filteredMeals = dummyMeals;

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _filteredMeals = dummyMeals.where((element) {
        if (_filters['gluten'] == true && !element.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] == true && !element.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] == true && !element.isVegan) {
          return false;
        }
        if (_filters['vegeterian'] == true && !element.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        iconTheme: const IconThemeData(color: Colors.purple),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodySmall: const TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1), fontSize: 14),
              bodyMedium: const TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1), fontSize: 16),
              bodyLarge: const TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1), fontSize: 20),
              titleSmall: const TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
              titleMedium: const TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
              titleLarge: const TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
        primaryColor: Colors.purple,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        accentColor: Colors.pink,
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Color.fromARGB(255, 175, 16, 219),
          onPrimary: Color.fromARGB(255, 255, 255, 255),
          secondary: Colors.amber,
          onSecondary: Color.fromARGB(255, 255, 255, 255),
          error: Colors.redAccent,
          onError: Color.fromARGB(255, 255, 255, 255),
          background: Colors.white,
          onBackground: Color.fromARGB(255, 166, 158, 158),
          surface: Colors.white,
          onSurface: Color.fromARGB(255, 166, 158, 158),
        ),
      ),
      // home: CategoriesScreen(), //устанавливаем домашнюю страницу
      initialRoute: '/', //устанавливаем значение домашней страницы
      routes: {
        '/': (ctx) => TabsScreenBottom(), //устанавливаем домашнюю страницу
        //это MAP поэтому в {}
        MealsOfCategoryScreen.routeName: (ctx) =>
            MealsOfCategoryScreen(_filteredMeals),
        MealDescriptionScreen.routeName: (ctx) => MealDescriptionScreen(),
        FiltersScreen.routeName: (ctx) => FiltersScreen(_setFilters),
      },
      /*onGenerateRoute: (settings) {
        //позволяет не регистрировать в Main(routes)
        //print(settings.arguments);
        if (settings.name == '/meal-description') {
          return MaterialPageRoute(
            builder: (_) => MealDescriptionScreen(),
          );
          //  } else if (settings.name == '/some-page') {
          //    return MaterialPageRoute(
          //     builder: (ctx) => SOME - PAGE - SCREEN(),
          //    );
        }
        //return MaterialPageRoute(
        //builder: (ctx) => MealDescriptionScreen(),
        //);
      }, //Не понял как работает */
      onUnknownRoute: (settings) {
        //если не нашел путь в зарегистрированных или в сгенерированных
        return MaterialPageRoute(
          builder: (ctx) => PageNotFoundScreen(),
        ); //можно задать страницу ОШИБКА
      },
    );
  }
}
