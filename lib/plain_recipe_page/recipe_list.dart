import 'package:flutter/material.dart';

import 'package:recipes/error_stuffs.dart';
import 'package:recipes/recipe_reader_from_json.dart';

class RecipeList extends StatelessWidget {
  final Future<List<Recipe>> _recipeList;
  final Function _callback;
  final int _selectedRecipe;

  RecipeList(this._recipeList, this._selectedRecipe, this._callback);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Recipe>>(
        future: _recipeList,
        builder: (BuildContext context, AsyncSnapshot<List<Recipe>> snapshot) {
          if (snapshot.hasData) {
            List<Widget> children = [];
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
                    this._callback(index, rec);
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
