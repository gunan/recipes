import 'package:flutter/material.dart';

class InstructionsCard extends StatelessWidget {
  final List<String> instructions;

  const InstructionsCard(this.instructions);

  Widget build(BuildContext context) {
    List<Card> _instructionList = this.instructions.map((val) {
      return Card(
          child: Text(
        val,
      ));
    }).toList();

    return Card(
      color: Colors.lightBlueAccent[50],
      child: Column(
        children: <Widget>[
              ListTile(
                  title: Text(
                "Get Cookin'",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              )),
              Divider(),
            ] +
            _instructionList,
      ),
    );
  }
}
