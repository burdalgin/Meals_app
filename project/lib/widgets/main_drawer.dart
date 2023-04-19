// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../screens/filters-screen.dart';

class MainDrawer extends StatelessWidget {
  //Использовать Widget вместо BuildMethod лучше в том случае если в виджете будет какое то изменение State или использование Theme которое может измениться, что то что может триггернуть Build виджета родителя

  Widget buildListTile(String title, IconData icon, Function() tapHandler) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: <Widget>[
          Container(
            height: 100,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Color.fromARGB(255, 255, 255, 255),
            child: Text('Cooking Up',
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 30,
                    color: Theme.of(context).primaryColor)),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile('Meals', Icons.restaurant, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildListTile('Filter meals', Icons.filter_vintage_rounded, () {
            Navigator.of(context).pushNamed(FiltersScreen
                .routeName); //если зашел с главного на Filters свайп назад сворачивает приложение
          }),
        ],
      ),
    );
  }
}
