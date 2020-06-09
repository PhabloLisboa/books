import 'package:books/models/ListReview.dart';
import 'package:books/models/ListReview.dart';
import 'package:flutter/material.dart';

class GridViewLists extends StatefulWidget {
  final listToManipulate;

  GridViewLists({this.listToManipulate = ListReview.getAll});

  @override
  _GridViewListsState createState() =>
      _GridViewListsState(this.listToManipulate);
}

class _GridViewListsState extends State<GridViewLists>
    with AutomaticKeepAliveClientMixin<GridViewLists> {
  @override
  bool get wantKeepAlive => true;

  final listToManipulate;
  _GridViewListsState(this.listToManipulate);

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return _mainStructure();
  }

  _mainStructure() {
    Future<List<ListReview>> listToShow = listToManipulate();
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
}
