import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:linked_scroll_widgets/linked_scroll_widgets.dart';

class LinkedOpacityAppBarPage extends StatefulWidget {
  @override
  _LinkedOpacityAppBarPageState createState() =>
      _LinkedOpacityAppBarPageState();
}

class _LinkedOpacityAppBarPageState extends State<LinkedOpacityAppBarPage> {
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
      appBar: LinkedOpacityAppBar(
        backgroundColor: Colors.deepOrange,
        scrollController: scrollController,
        toggleOffsetY: 200,
        title:
            Text("haha", style: TextStyle(fontSize: 20, color: Colors.black)),
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
