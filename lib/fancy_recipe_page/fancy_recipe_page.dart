import 'package:flutter/material.dart';

class FancyRecipePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('MyFancyRecipe')),
      body: Center(
          child: Row(
        children: [
          // Placeholder for recipe menu
          SizedBox(
            width: 200,
            height: 400,
            child: ListView(
              children: [
                ListTile(title: Text("recipe 1")),
                ListTile(title: Text("recipe 2"))
              ],
            ),
          ),
          VerticalDivider(),
          SizedBox(
            width: 400,
            height: 400,
            child: Card(
              child: Column(
                children: [
                  ListTile(
                      title: Text('Prepare chicken'),
                      subtitle: Text('foo bar baz')),
                  Divider(),
                  Text('Some Recipe stuff'),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
