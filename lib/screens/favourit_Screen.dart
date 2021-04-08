import 'package:elmat3m/models/meal.dart';
import 'package:elmat3m/widgets/meal_item.dart';
import 'package:flutter/material.dart';
import '../screens/favourit_Screen.dart';

class FavouritesScreen extends StatelessWidget {

  final List<Meal> favouriteMeal;
FavouritesScreen(this.favouriteMeal);
  @override
  Widget build(BuildContext context) {
    if(favouriteMeal.isEmpty){
      return Center(
        child: Text("You have no Favorites items"),
      );
    }else{
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favouriteMeal[index].id,
            imageUrl: favouriteMeal[index].imageUrl,
            title: favouriteMeal[index].title,
            affordability: favouriteMeal[index].affordability,
            complexity: favouriteMeal[index].complexity,
            duration: favouriteMeal[index].duration,
          );
        },
        itemCount: favouriteMeal.length,
      );
    }




  }
}
