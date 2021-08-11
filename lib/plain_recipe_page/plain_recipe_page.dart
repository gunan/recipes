import 'package:flutter/material.dart';

import 'package:recipes/recipe_reader_from_json.dart';

class PlainRecipePage extends StatefulWidget {
  @override
  _PlainRecipePageState createState() => _PlainRecipePageState();
}

class _PlainRecipePageState extends State<PlainRecipePage> {
  // Just bear with me for now...
  final Future<List<Recipe>> _recipeList = loadRecipesFromJSON();
  final int _selectedRecipe = 1;

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
                for (var i in snapshot.data ?? []) {
                  children.add(ListTile(title: Text(i.name)));
                }
                return ListView(children: children);
              } else if (snapshot.hasError) {
                return Column(
                  children: <Widget>[
                    const Icon(
                      Icons.error_outline,
                      color: Colors.red,
                      size: 60,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Text('Error: ${snapshot.error}'),
                    )
                  ],
                );
              } else {
                return Column(
                  children: <Widget>[
                    SizedBox(
                      child: CircularProgressIndicator(),
                      width: 60,
                      height: 60,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 16),
                      child: Text('Awaiting result...'),
                    )
                  ],
                );
              }
            }),
      ),
    );
  }

  Widget createRecipeView() {
    // if nothing is selected yet, let people know how to select something
    // Recipe r = _recipeList.recipes[_selectedRecipe];
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SizedBox(
        width: 600,
        height: 10000,
        child: Card(
          child: Column(
            children: [
              ListTile(
                  title: Text('Dice Chicken'), subtitle: Text('foo bar baz')),
              Divider(),
              ListTile(
                  title: Text('Fry chicken with olive oil and tandoori masala'),
                  subtitle: Text('foo bar baz')),
              Divider(),
              Text('Some Recipe stuff\n\n\n\n\n\na\n\nn\n\n\n\na\n\n\n\n\na'),
            ],
          ),
        ),
      ),
    );
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
