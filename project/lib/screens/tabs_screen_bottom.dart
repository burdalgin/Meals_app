import 'package:flutter/material.dart';
import 'categories_screen.dart';
import './favorites_screen.dart';
import '../widgets/main_drawer.dart';

//Табы внизуу экрана
class TabsScreenBottom extends StatefulWidget {
  @override
  State<TabsScreenBottom> createState() => _TabsScreenBottom();
}

class _TabsScreenBottom extends State<TabsScreenBottom> {
  final List<Map<String, Object>> _pages = [
    {
      'page': CategoriesScreen(),
      'title': 'Categories',
    },
    {
      'page': FavoritesScreen(),
      'title': 'Your Favorite',
    }
  ]; //можно жобавить все что угодно, к чему нужен доступ в зависимости от выбпанного экрана

  int _selectedPageIndex = 0;

  void _pageSelector(
      int index) //Flutter автоматически определяет Index при onTap и ндексирует элементы!!!
  {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return
        //Scaffold этого экрана котролирует другие экраны, в других экранах вызываемых из TabBar не нужно использовать Scaffold
        Scaffold(
      appBar: AppBar(
        title:
            Center(child: Text(_pages[_selectedPageIndex]['title'] as String)),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
          onTap: _pageSelector,
          selectedItemColor: Colors.white70,
          unselectedItemColor: Colors.grey,
          backgroundColor: Theme.of(context).primaryColor,
          currentIndex:
              _selectedPageIndex, //указывает виджету какой таб выбран чтобы поменять Selected - Unselected color
          // type: BottomNavigationBarType.shifting, // прикольная анимация но текст неактивного таба исчезает
          items: [
            BottomNavigationBarItem(
              //backgroundColor: Theme.of(context).primaryColor, // нужно определить здесь если выбран type: BottomNavigationBarType.shifting
              icon: Icon(
                Icons.category,
              ),
              label: 'Categories',
            ),
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite_border,
              ),
              label: 'Favorite',
            ),
          ]),
    );
  }
}
