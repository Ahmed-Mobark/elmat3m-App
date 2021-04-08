import 'package:flutter/material.dart';
import 'categoried_Screen.dart';
import 'favourit_Screen.dart';
import '../widgets/main_drawer.dart';
import '../models/meal.dart';

class TabScreen extends StatefulWidget {

  final List<Meal> favouriteMeal;
  TabScreen(this.favouriteMeal);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {

  List<Map<String,Object>> _page;


  int _selectedPageIndex=0;
  @override
  void initState() {
    _page=[
      {
        'page':CategoriesScreen(),
        'title':'Categories',
      },
      {
        'page':FavouritesScreen(widget.favouriteMeal),
        'title':'Favourites',
      },
    ];
    super.initState();
  }

  void _selectPage(int value) {
    setState(() {
      _selectedPageIndex=value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_page[_selectedPageIndex]['title']),
      ),
      body: _page[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap:_selectPage ,
        fixedColor: Colors.amber,
        items:[
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text("Categories"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text("Favourites"),
          ),
        ]

        ),
      drawer: MainDrawer(),
      );
  }


}
