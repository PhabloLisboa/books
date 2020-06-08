import 'package:books/models/Book.dart';
import 'package:books/models/ListReview.dart';
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

  Widget _body() {
    Future<List<ListReview>> listToShow = ListReview.getAll();
    // List listToShow = [

    return FutureBuilder(
      future: listToShow,
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return Center(child: CircularProgressIndicator());

        return _mainContent(snapshot.data);
      },
    );
  }
}

_mainContent(List<ListReview> listReview) {
  return Center(
    child: GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: listReview.length,
      itemBuilder: (context, index) => Container(
        child: Card(
          child: Stack(
            children: <Widget>[
              SizedBox.expand(
                  child: Image.network(
                listReview[index].listImage,
                fit: BoxFit.cover,
              )),
              Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(color: Colors.black87),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Center(
                        child: Text(
                      listReview[index].listName,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    )),
                    Row(
                      children: <Widget>[
                        FlatButton(
                          onPressed: null,
                          child: Icon(
                            Icons.details,
                            color: Colors.white,
                          ),
                        ),
                        FlatButton(
                          onPressed: null,
                          child: Icon(
                            Icons.share,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
