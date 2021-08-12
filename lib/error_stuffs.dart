import 'package:flutter/material.dart';

Widget fancyErrorMessage(String error) {
  return Column(
    children: <Widget>[
      const Icon(
        Icons.error_outline,
        color: Colors.red,
        size: 60,
      ),
      Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Text('Error: $error'),
      )
    ],
  );
}

Widget fancyProgressIndicator() {
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
