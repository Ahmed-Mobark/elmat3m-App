import '../widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';

  @override
  FilterScreenState createState() {
    return new FilterScreenState();
  }
}

class FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _loctoseFree = false;
  bool _vegan = false;
  bool _vegtarian = false;

  Widget buildSwitchListTile(String title, String description,
      bool currentValue, Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Filter"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: Text(
              "Adjust Your Meal Selection .",
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                buildSwitchListTile(
                  "GlutenFree",
                  "only include free meal ",
                  _glutenFree,
                  (newValue) {
                    setState(() {
                      _glutenFree=newValue;
                    });
                  },
                ),
                buildSwitchListTile(
                  "LoctoseFree",
                  "only include free meal ",
                  _loctoseFree,
                      (newValue) {
                    setState(() {
                      _loctoseFree=newValue;
                    });
                  },
                ),
                buildSwitchListTile(
                  "Vegan",
                  "only include free meal ",
                  _vegan,
                      (newValue) {
                    setState(() {
                      _vegan=newValue;
                    });
                  },
                ),
                buildSwitchListTile(
                  "Vegtarian",
                  "only include free meal ",
                  _vegtarian,
                      (newValue) {
                    setState(() {
                      _vegtarian=newValue;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
