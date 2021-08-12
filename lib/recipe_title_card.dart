import 'package:flutter/material.dart';

class RecipeTitleCard extends Card {
  RecipeTitleCard(String title)
      : super(
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
