import 'package:flutter/material.dart';

import 'package:recipes/error_stuffs.dart';
import 'package:recipes/recipe_reader_from_json.dart';

class RecipeList extends StatefulWidget {
  final Future<List<Recipe>> _recipeList;
  final Function _callback;

  RecipeList(this._recipeList, this._callback);

  @override
  State<RecipeList> createState() =>
      _RecipeListState(this._recipeList, this._callback);
}

class _RecipeListState extends State<RecipeList> {
  final Future<List<Recipe>> _recipeList;
  final Function _callback;

  int _selectedRecipe = -1;

  _RecipeListState(this._recipeList, this._callback);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Recipe>>(
        future: _recipeList,
        builder: (BuildContext context, AsyncSnapshot<List<Recipe>> snapshot) {
          if (snapshot.hasData) {
            List<Widget> children = [
              DrawerHeader(
                  child: Column(children: [
                Row(children: [
                  Icon(Icons.restaurant, color: Colors.grey, size: 40),
                  Text('Pick an item'),
                ]),
                TextField(),
              ]))
            ];
            int i = 0;
            for (var rec in snapshot.data ?? []) {
              int index = i;
              children.add(
                GestureDetector(
                  child: Container(
                    color: i == _selectedRecipe ? Colors.blue : Colors.white,
                    child: ListTile(title: Text(rec.name)),
                  ),
                  onTap: () {
                    setState(() {
                      this._selectedRecipe = index;
                    });
                    this._callback(rec);
                  },
                ),
              );
              i++;
            }
            return ListView(children: children);
          } else if (snapshot.hasError) {
            return fancyErrorMessage(snapshot.error.toString());
          } else {
            return fancyProgressIndicator();
          }
        });
  }
}
