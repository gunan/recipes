import 'package:flutter/material.dart';

class IngredientsCard extends StatelessWidget {
  final List<String> ingredients;

  const IngredientsCard(this.ingredients);

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
