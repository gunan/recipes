import 'package:flutter/material.dart';
import 'package:recipes/recipe_reader_from_json.dart';

class IngredientsCard extends StatefulWidget {
  List<String> ingredients;

  IngredientsCard(this.ingredients);

  @override
  _IngredientsCardState createState() => _IngredientsCardState(ingredients);
}

class _IngredientsCardState extends State<IngredientsCard> {
  List<String> ingredients;

  _IngredientsCardState(this.ingredients);

  Widget build(BuildContext context) {
    List<ListTile> _ingredientsList = this.ingredients.map((val) {
      return ListTile(title: Text(val));
    }).toList();

    return Card(
      child: Column(
        children: [
              ListTile(
                  title: Text(
                "Ingredients",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              )),
              Divider(),
            ] +
            _ingredientsList,
      ),
    );
  }
}
