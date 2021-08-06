import 'dart:html';

import 'package:flutter/material.dart';

class FancyRecipePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('MyFancyRecipe')),
      body: SizedBox(
        width: 400,
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
    );
  }
}
