import 'package:flutter/material.dart';

alert(context, msg) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => WillPopScope(
      child: AlertDialog(
        title: Text("Books"),
        content: Text(msg),
        actions: <Widget>[
          FlatButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Ok"),
          )
        ],
      ),
      onWillPop: () async => false,
    ),
  );
}
