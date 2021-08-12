import 'package:flutter/material.dart';

class RecipeTitleCard extends StatelessWidget {
  final String title;
  RecipeTitleCard(this.title);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
            title: Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    )));
  }
}
