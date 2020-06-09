import 'package:books/models/ListReview.dart';
import 'package:books/models/User.dart';
import 'package:books/utils/prefs.dart.dart';
import 'package:books/widgets/Drawer.dart';
import 'package:books/widgets/GridViewLists.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin<Home> {
  TabController _tabController;

  AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      Prefs.setInt('tabIndex', _tabController.index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Books"),
        bottom: TabBar(controller: _tabController, tabs: [
          Tab(text: "All"),
          Tab(text: "Weekly"),
          Tab(text: "Monthly"),
        ]),
      ),
      body: _body(),
      drawer: DrawerList(),
    );
  }

  Widget _body() {
    return TabBarView(
      controller: _tabController,
      children: <Widget>[
        GridViewLists(),
        GridViewLists(listToManipulate: ListReview.getAllWeekly),
        GridViewLists(listToManipulate: ListReview.getAllMonthly),
      ],
    );
  }
}
