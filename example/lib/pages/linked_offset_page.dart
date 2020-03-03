import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:linked_scroll_widgets/linked_scroll_widgets.dart';

class LinkedOffsetPage extends StatefulWidget {
  @override
  _LinkedOffsetPageState createState() => _LinkedOffsetPageState();
}

class _LinkedOffsetPageState extends State<LinkedOffsetPage> {
  ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        transitionBetweenRoutes: false,
        middle: LinkedOffsetWidget(
          child: Text("offset会变的哦"),
          scrollController: scrollController,
        ),
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
