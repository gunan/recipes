import 'package:flutter/material.dart';

import 'package:recipes/error_stuffs.dart';
import 'package:recipes/plain_recipe_page/ingredients_card.dart';
import 'package:recipes/plain_recipe_page/instructions_card.dart';
import 'package:recipes/plain_recipe_page/recipe_list.dart';
import 'package:recipes/recipe_reader_from_json.dart';
import 'package:recipes/plain_recipe_page/recipe_title_card.dart';

class PlainRecipePage extends StatefulWidget {
  @override
  _PlainRecipePageState createState() => _PlainRecipePageState();
}

class _PlainRecipePageState extends State<PlainRecipePage> {
  // Just bear with me for now...
  final Future<List<Recipe>> _recipeList = loadRecipesFromJSON();
  final GlobalKey<ScaffoldState> _scaffoldKeyForDrawer =
      new GlobalKey<ScaffoldState>();
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

  Widget createRecipeView(BuildContext context) {
    // if nothing is selected yet, let people know how to select something
    if (_recipeToView == null) {
      _scaffoldKeyForDrawer.currentState?.openDrawer();
      return Text("Please first select a recipe.",
          style: TextStyle(fontSize: 24));
    } else {
      return _buildRecipeStuff(this._recipeToView);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Gunhan\'s super recipes')),
      drawer: Drawer(
          child: RecipeList(this._recipeList, (r) {
        setState(() {
          this._recipeToView = r;
        });
      })),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: createRecipeView(context),
      ),
      key: _scaffoldKeyForDrawer,
    );
  }
}
