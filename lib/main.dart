import 'package:elmat3m/dummy_data.dart';
import 'package:elmat3m/screens/categoried_Screen.dart';
import 'package:flutter/material.dart';
import './screens/category_meal_screen.dart';
import './screens/meal_details_screen.dart';
import './screens/tabs_Screen.dart';
import './screens/filter_screen.dart';
import './models/meal.dart';
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {

  @override
  MyAppState createState() {
    return new MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  List<Meal> _favoriteMeals=[];
  List<Meal> _availableMeal=DUMMY_MEALS;

  void _toggleFavorite(String mealId){
   final existingIndex= _favoriteMeals.indexWhere((meal)=>meal.id==mealId);
   if(existingIndex >=0){
     setState(() {
       _favoriteMeals.removeAt(existingIndex);
     });
   }
   else{
     setState(() {
       _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal)=>meal.id==mealId));
     });
   }

  }
  bool _isMealFavorite(String id){
    return _favoriteMeals.any((meal)=>meal.id==id);

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
          body1: TextStyle(
            color: Color.fromRGBO(20,50,50,1),
          ),
          body2: TextStyle(
            color: Color.fromRGBO(20,50,50,1),
          ),
          title: TextStyle(
            fontSize: 20,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: CategoriesScreen(),
      routes: {
        '/':(context)=>TabScreen(_favoriteMeals),
        CategoryMealScreen.routeName :(context) =>CategoryMealScreen(),
        MealDerailScreen.routeName :(context) =>MealDerailScreen(_toggleFavorite,_isMealFavorite),
        FilterScreen.routeName :(context)=>FilterScreen(),
      },
    );
  }
}

