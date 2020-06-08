import 'package:books/models/User.dart';
import 'package:books/models/Login.dart';
import 'package:books/pages/home.dart';
import 'package:books/utils/nav.dart';
import 'package:books/widgets/alert.dart';
import 'package:books/widgets/button.dart';
import 'package:books/widgets/text_form.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  final loginField = TextEditingController(text: "Phablo");
  final passField = TextEditingController(text: "123456");
  final formKey = GlobalKey<FormState>();
  bool _loading;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Books"),
        centerTitle: true,
      ),
      body: _body(),
    );
  }

  _body() {
    return Container(
        padding: EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: ListView(
            children: <Widget>[
              TextFormCustom(
                "Login",
                "Username or email",
                controller: loginField,
                validator: (String text) {
                  return text.isEmpty ? 'Por favor, preencha este campo' : null;
                },
              ),
              SizedBox(height: 10),
              TextFormCustom("Password", "*********",
                  password: true,
                  controller: passField, validator: (String text) {
                return text.isEmpty ? 'Por favor, preencha este campo' : null;
              }),
              SizedBox(height: 20),
              Container(
                height: 46,
                child: Button(
                  "Sign In",
                  fontSize: 20,
                  onClick: _onClick,
                  loading: _loading,
                ),
              )
            ],
          ),
        ));
  }

  _onClick() async {
    if (!formKey.currentState.validate()) return;

    setState(() {
      _loading = true;
    });

    final loginResponse = await Login.login(loginField.text, passField.text);

    setState(() {
      _loading = false;
    });

    if (loginResponse.ok) {
      User usuario = loginResponse.result;

      push(context, Home(usuario), replace: true);
    } else {
      alert(context, loginResponse.msg);
    }
  }
}
