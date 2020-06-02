import 'package:books/models/User.dart';
import 'package:books/widgets/Drawer.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  User usuario;

  Home(this.usuario);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Books"),
      ),
      body: _body(),
      drawer: DrawerList(),
    );
  }

  _body() {
    return Center(
      child: Text("Texto"),
    );
  }
}
