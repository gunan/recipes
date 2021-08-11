import 'package:flutter/material.dart';

class PlainRecipePage extends StatefulWidget {
  @override
  _PlainRecipePageState createState() => _PlainRecipePageState();
}

class _PlainRecipePageState extends State<PlainRecipePage> {
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
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: SizedBox(
                      width: 200,
                      height: 1000,
                      child: ListView(
                        children: [
                          ListTile(title: Text("Butter Chicken")),
                          ListTile(title: Text("recipe 2"))
                        ],
                      ),
                    ),
                  ),
                  VerticalDivider(),
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: SizedBox(
                      width: 600,
                      height: 10000,
                      child: Card(
                        child: Column(
                          children: [
                            ListTile(
                                title: Text('Dice Chicken'),
                                subtitle: Text('foo bar baz')),
                            Divider(),
                            ListTile(
                                title: Text(
                                    'Fry chicken with olive oil and tandoori masala'),
                                subtitle: Text('foo bar baz')),
                            Divider(),
                            Text(
                                'Some Recipe stuff\n\n\n\n\n\na\n\nn\n\n\n\na\n\n\n\n\na'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ))),
    );
  }
}
