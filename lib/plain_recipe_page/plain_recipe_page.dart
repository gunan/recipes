import 'package:flutter/material.dart';

import 'package:recipes/error_stuffs.dart';
import 'package:recipes/ingredients_card.dart';
import 'package:recipes/instructions_card.dart';
import 'package:recipes/recipe_reader_from_json.dart';
import 'package:recipes/recipe_title_card.dart';

class PlainRecipePage extends StatefulWidget {
  @override
  _PlainRecipePageState createState() => _PlainRecipePageState();
}

class _PlainRecipePageState extends State<PlainRecipePage> {
  // Just bear with me for now...
  final Future<List<Recipe>> _recipeList = loadRecipesFromJSON();
  int _selectedRecipe = -1;
  Recipe? _recipeToView;

  Widget _buildRecipeStuff(Recipe? r) {
    if (r == null) {
      return fancyErrorMessage("Everything is something happened.");
    } else {
      return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SizedBox(
          width: 600,
          child: Column(
            children: [
              // title
              RecipeTitleCard(r.name),
              IngredientsCard(r.ingredients),
              InstructionsCard(r.steps),
            ],
          ),
        ),
      );
    }
  }

  Widget createRecipeNameList(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SizedBox(
        width: 200,
        height: 1000,
        child: FutureBuilder<List<Recipe>>(
            future: _recipeList,
            builder:
                (BuildContext context, AsyncSnapshot<List<Recipe>> snapshot) {
              if (snapshot.hasData) {
                List<Widget> children = [];
                int i = 0;
                for (var rec in snapshot.data ?? []) {
                  int index = i;
                  children.add(
                    GestureDetector(
                      child: Container(
                        color:
                            i == _selectedRecipe ? Colors.blue : Colors.white,
                        child: ListTile(title: Text(rec.name)),
                      ),
                      onTap: () {
                        setState(() {
                          _selectedRecipe = index;
                          _recipeToView = rec;
                        });
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
            }),
      ),
    );
  }

  Widget createRecipeView() {
    // if nothing is selected yet, let people know how to select something
    if (_selectedRecipe == -1) {
      return Text("Please first select a recipe from the left side.",
          style: TextStyle(fontSize: 24));
    } else {
      return _buildRecipeStuff(this._recipeToView);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Plain Recipe Page')),
      body: Center(
          child: SizedBox(
              width: 820,
              height: 800,
              child: Row(
                children: [
                  // Placeholder for recipe menu
                  createRecipeNameList(context),
                  VerticalDivider(),
                  createRecipeView(),
                ],
              ))),
    );
  }
}
