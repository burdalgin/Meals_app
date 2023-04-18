import 'package:flutter/material.dart';
import '../data/dummy_data.dart';
import '../widgets/meal_item.dart';

class MealDescriptionScreen extends StatelessWidget {
  //const MealDescriptionScreen({super.key});
  static const routeName = '/meal-description';

  Widget buildTitle(context, String title) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments as String;
    final chosedMeal = dummyMeals.firstWhere((element) =>
        element.id ==
        mealId); //ВАЖНО!!! firstWhere возвращает 1 елемент!!! Что нам и нужно! Просто Where подразумевает несколько.
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
          title: Text(
              'Meal - ${chosedMeal.title}')), //если указываем элемент списка то хаключить нужно в {}
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(children: [
              SizedBox(
                height: (mediaQuery.size.height -
                        MediaQuery.of(context).padding.top) *
                    0.35,
                width: double.infinity,
                child: Image.network(
                  chosedMeal.imageUrl,
                  fit: BoxFit
                      .fill, //заполняет контейнер картинкой, без пустых полей
                ),
              ),
              Positioned(
                //виджет дляфиксированно размещения елемента
                bottom: 0,
                right: 0,
                child: Container(
                  //заворачиваем Text в SizedBox для того чтобы он не вылезал за границы
                  width: mediaQuery.size.width,
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  color: const Color.fromARGB(83, 0, 0, 0),

                  child: Text(
                    'Cooking Duration - ${chosedMeal.duration} min',
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                    softWrap: true,
                    overflow: TextOverflow.fade,
                  ),
                ),
              ),
            ]),
            Card(
              child: Column(
                children: [
                  buildTitle(context, 'Ingridients'),
                  SizedBox(
                    height: (mediaQuery.size.height -
                            MediaQuery.of(context).padding.top) *
                        0.20,
                    child: ListView.builder(
                      itemCount: chosedMeal.ingredients.length,
                      itemBuilder: (ctc, index) => Column(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            margin: const EdgeInsets.only(left: 20, right: 20),
                            child: Text(
                              chosedMeal.ingredients[index],
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                          Divider(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            buildTitle(context, 'Steps'),
            Column(
              children: [
                SizedBox(
                  height: (mediaQuery.size.height -
                          MediaQuery.of(context).padding.top) *
                      0.35,
                  child: ListView.builder(
                    itemCount: chosedMeal.steps.length,
                    itemBuilder: (ctc, index) => Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 20, right: 20),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Theme.of(context).primaryColor,
                              child: Text('${(index + 1)}'),
                            ),
                            title: Text(
                              chosedMeal.steps[index],
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                        ),
                        Divider(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        onPressed: () => Navigator.of(context).pop(
            mealId) //pop() удаляет экран на первом уровне стека экранов и передает значение mealId
        ,
      ),
    );
  }
}
