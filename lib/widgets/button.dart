import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Color color;
  final Color textColor;
  final String text;
  final double fontSize;
  final Function onClick;
  bool loading;

  Button(this.text,
      {@required this.onClick,
      this.color = Colors.teal,
      this.textColor = Colors.white,
      this.fontSize = 16,
      this.loading = false});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: this.loading == true
          ? Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            )
          : Text(
              this.text,
              style: TextStyle(color: this.textColor, fontSize: this.fontSize),
            ),
      color: this.color,
      onPressed: this.onClick,
    );
  }
}
