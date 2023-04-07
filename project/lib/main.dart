import 'package:flutter/material.dart';
import './categories_screen.dart';
import './meals_of_catergory_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodySmall: const TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1), fontSize: 10),
              bodyMedium: const TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1), fontSize: 12),
              bodyLarge: const TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1), fontSize: 14),
              titleSmall: const TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                  fontSize: 10,
                  fontWeight: FontWeight.bold),
              titleMedium: const TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
              titleLarge: const TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
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
        '/': (ctx) => CategoriesScreen(), //устанавливаем домашнюю страницу
        //это MAP поэтому в {}
        MealsOfCategoryScreen.routeName: (ctx) => MealsOfCategoryScreen(),
      },
    );
  }
}
