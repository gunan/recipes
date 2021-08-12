import 'package:flutter/material.dart';

class RecipeTitleCard extends Card {
  RecipeTitleCard(String title)
      : super(
            child: ListTile(
                title: Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        )));
}
