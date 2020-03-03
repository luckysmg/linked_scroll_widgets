import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:linked_scroll_widgets/linked_scroll_widgets.dart';

class LinkedOpacityNavigationBarPage extends StatefulWidget {
  @override
  _LinkedOpacityNavigationBarPageState createState() =>
      _LinkedOpacityNavigationBarPageState();
}

class _LinkedOpacityNavigationBarPageState
    extends State<LinkedOpacityNavigationBarPage> {
  ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: LinkedOpacityNavigationBar(
        transitionBetweenRoutes: false,
        scrollController: scrollController,
        backgroundColor: Colors.blueAccent,
        middle: Text("这个导航栏透明度会变哦"),
      ),
      body: ListView.builder(
        controller: scrollController,
        padding: EdgeInsets.only(),
        itemCount: 40,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(left: 20, top: 20),
            child: Text('$index', style: TextStyle(fontSize: 25)),
          );
        },
      ),
    );
  }
}
