import 'package:flutter/material.dart';
import 'categories_screen.dart';
import './favorites_screen.dart';
import '../widgets/main_drawer.dart';
import '../models/meal.dart';

//Табы наверху экрана
class TabsScreen extends StatefulWidget {
  // const TabsScreen({super.key});

  late List<Meal> favoritesmeals;

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0, //первый таб по дефолту активный
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Meals')),
          bottom: const TabBar(
            indicatorColor: Color.fromARGB(255, 169, 145, 234),
            indicatorWeight: 3.0,
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.category),
                text: 'Categories',
              ),
              Tab(
                icon: Icon(Icons.star),
                text: 'Favorite',
              )
            ],
          ),
        ),
        drawer: MainDrawer(),
        body: TabBarView(children: <Widget>[
          // размещаем ссылки на экраны
          CategoriesScreen(),
          FavoritesScreen(widget.favoritesmeals),
        ]),
      ),
    );
  }
}
