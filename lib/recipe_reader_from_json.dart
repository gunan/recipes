import 'dart:async' show Future;
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

// All hacky data population stuffs. Also learn json stuffs

class Recipe {
  String name;
  String description;
  List<String> ingredients;
  List<String> steps;

  Recipe(Map<String, dynamic> jsonRecipe)
      : name = jsonRecipe["recipeName"],
        description = jsonRecipe["recipeDetails"],
        ingredients = jsonRecipe["ingredients"].cast<String>(),
        steps = jsonRecipe["steps"].cast<String>();
}

Future<List<Recipe>> loadRecipesFromJSON() async {
  String fdata = await rootBundle.loadString('assets/recipes.json');
  var rawRecipeData = jsonDecode(fdata);

  List<Recipe> recipes = [];

  for (var r in rawRecipeData) {
    recipes.add(Recipe(r));
  }

  return recipes;
}
