import 'package:books/pages/login_page.dart';
import 'package:books/utils/nav.dart';
import 'package:flutter/material.dart';

class DrawerList extends StatefulWidget {
  @override
  _DrawerListState createState() => _DrawerListState();
}

class _DrawerListState extends State<DrawerList>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Neil Gaiman"),
              accountEmail: Text("ng@email.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://www.intrinseca.com.br/upload/autor/Autor_Neil%20Gaiman_150x150.jpg"),
              ),
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text("Favoritos"),
              subtitle: Text("mais informações..."),
              trailing: Icon(Icons.arrow_forward),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text("Ajuda"),
              subtitle: Text("mais informações..."),
              trailing: Icon(Icons.arrow_forward),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text("Log Out"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.pop(context);
                push(context, LoginPage(), replace: true);
              },
            ),
          ],
        ),
      ),
    );
  }
}
