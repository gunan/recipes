import 'package:flutter/material.dart';

class IngredientsCard extends StatefulWidget {
  final List<String> ingredients;

  IngredientsCard(this.ingredients);

  @override
  _IngredientsCardState createState() => _IngredientsCardState(ingredients);
}

class _IngredientsCardState extends State<IngredientsCard> {
  final List<String> ingredients;

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
