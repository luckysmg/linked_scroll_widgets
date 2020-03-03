import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:linked_scroll_widgets/linked_scroll_widgets.dart';

class LinkedSizePage extends StatefulWidget {
  @override
  _LinkedSizePageState createState() => _LinkedSizePageState();
}

class _LinkedSizePageState extends State<LinkedSizePage> {
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
        middle: Container(
          decoration: BoxDecoration(
            color: Colors.deepOrange,
            borderRadius: BorderRadius.circular(6),
          ),
          child: LinkedSizeWidget(
            child: Text("size会变的哦"),
            finalWidth: 300,
            scrollController: scrollController,
            originalWidth: 100,
          ),
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
