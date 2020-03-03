import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'pages/linked_offset_page.dart';
import 'pages/linked_opacity_app_bar_page.dart';
import 'pages/linked_opacity_navigation_bar_page.dart';
import 'pages/linked_opacity_page.dart';
import 'pages/linked_size_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Page(),
    );
  }
}

class Page extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text("Example"),
      ),
      body: ListView(
        children: <Widget>[
          _buildWidget("LinkedSizeWidget", () {
            Navigator.push(context,
                CupertinoPageRoute(builder: (context) => LinkedSizePage()));
          }),
          _buildWidget("LinkedOffsetWidget", () {
            Navigator.push(context,
                CupertinoPageRoute(builder: (context) => LinkedOffsetPage()));
          }),
          _buildWidget("LinkedOpacityWidget", () {
            Navigator.push(context,
                CupertinoPageRoute(builder: (context) => LinkedOpacityPage()));
          }),
          _buildWidget("LinkedOpacityAppBarPage", () {
            Navigator.push(
                context,
                CupertinoPageRoute(
                    builder: (context) => LinkedOpacityAppBarPage()));
          }),
          _buildWidget("LinkedOpacityNavigationBar", () {
            Navigator.push(
                context,
                CupertinoPageRoute(
                    builder: (context) => LinkedOpacityNavigationBarPage()));
          }),
        ],
      ),
    );
  }

  Widget _buildWidget(String text, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
        child: Text(text, style: TextStyle(fontSize: 30)),
      ),
    );
  }
}
