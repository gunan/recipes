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
  String _filterText = "";

  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  _RecipeListState(this._recipeList, this._callback);

  Map<int, Recipe> _createFilteredRecipeList(
      List<Recipe> rList, String filter) {
    Map<int, Recipe> retval = Map<int, Recipe>();
    for (int i = 0; i < rList.length; i++) {
      if (rList[i].name.contains(filter)) {
        retval[i] = rList[i];
      }
    }
    return retval;
  }

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
                TextField(
                    controller: _controller,
                    onChanged: (String value) async {
                      setState(() {
                        this._filterText = value;
                      });
                    },
                    decoration:
                        InputDecoration(prefixIcon: Icon(Icons.search))),
              ]))
            ];
            _createFilteredRecipeList(snapshot.data ?? [], _filterText)
                .forEach((key, value) {
              children.add(
                GestureDetector(
                  child: Container(
                    color: key == _selectedRecipe ? Colors.blue : Colors.white,
                    child: ListTile(title: Text(value.name)),
                  ),
                  onTap: () {
                    setState(() {
                      this._selectedRecipe = key;
                    });
                    this._callback(value);
                  },
                ),
              );
            });

            return ListView(children: children);
          } else if (snapshot.hasError) {
            return fancyErrorMessage(snapshot.error.toString());
          } else {
            return fancyProgressIndicator();
          }
        });
  }
}
