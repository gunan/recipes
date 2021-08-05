import 'package:flutter/material.dart';

class GridButton extends StatelessWidget {
  final void Function() onClick;
  final Color color;
  final String text;

  GridButton(this.text, this.color, this.onClick);

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: this.onClick,
        child: Container(
          decoration: BoxDecoration(
            color: this.color,
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
            boxShadow: [
              BoxShadow(color: Colors.grey.shade200, spreadRadius: 3)
            ],
          ),
          child: Center(
            child: Text(
              this.text,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      );
}
