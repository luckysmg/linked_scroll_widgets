import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:linked_scroll_widgets/linked_scroll_widgets.dart';

class LinkedOpacityPage extends StatefulWidget {
  @override
  _LinkedOpacityPageState createState() => _LinkedOpacityPageState();
}

class _LinkedOpacityPageState extends State<LinkedOpacityPage> {
  ScrollController controller;

  @override
  void initState() {
    super.initState();
    controller = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: LinkedOpacityWidget(
          child: Text("透明会变的哦"),
          scrollController: controller,
        ),
      ),
      body: ListView.builder(
        controller: controller,
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
