import 'package:flutter/material.dart';
import 'package:elmat3m/dummy_data.dart';
import '../widgets/catrgory_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
     // appBar: AppBar(title: Text("meal"),),
      body: GridView(
        padding: EdgeInsets.all(25),
        children:DUMMY_CATEGORIES.map((catData) =>
        CategoryItem(catData.id,catData.title,catData.color),
        ).toList() ,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        ),

      ),
    );
  }
}