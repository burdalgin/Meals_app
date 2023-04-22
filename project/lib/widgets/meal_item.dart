import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../screens/meal_desctription_screen.dart';

class MealItem extends StatelessWidget {
  //const MealItem({super.key});
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  const MealItem({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.complexity,
    required this.affordability,
  });

  String get complexitiText //задаем значения enum аргументу
  {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';

      case Complexity.Challenging:
        return 'Challenging';

      case Complexity.Hard:
        return 'Hard';

      default:
        return 'Unknown';
    }
  }

  String get afordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
      case Affordability.Luxurious:
        return 'Luxurious';
      case Affordability.Pricey:
        return 'Pricey';
      default:
        return 'Unknown';
    }
  }

  void selectMeal(BuildContext ctx) {
    Navigator.of(ctx)
        .pushNamed(MealDescriptionScreen.routeName,
            arguments:
                id) //когда закрывается экран MealDescriptionScreen тогда выполняется then
        .then((mealIdPopFromMealDescriptionScreen) {
      if (mealIdPopFromMealDescriptionScreen != null) {
        // removeItemCallBack(mealIdPopFromMealDescriptionScreen);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        elevation: 5,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  //для того чтобы картина легла в контейнер ровно с закруглеммынми краями
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(5),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit
                        .cover, //для того чтобы картина заполнила контейнер
                  ),
                ),
                Positioned(
                  //виджет дляфиксированно размещения елемента
                  bottom: 10,
                  right: 10,
                  child: Container(
                    //заворачиваем Text в SizedBox для того чтобы он не вылезал за границы
                    width: 300,
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    color: const Color.fromARGB(83, 0, 0, 0),

                    child: Text(
                      title,
                      style: const TextStyle(fontSize: 26, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.schedule,
                          color: Theme.of(context).iconTheme.color),
                      const SizedBox(
                        width: 6,
                      ),
                      Text('$duration min'),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.work,
                          color: Theme.of(context).iconTheme.color),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(complexitiText),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.attach_money,
                        color: Theme.of(context).iconTheme.color,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(afordabilityText),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
