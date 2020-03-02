# linked_scroll_widgets

A lib full of widgets that can react to the scrollController's offset change,to custom your UI effect.

## Get started with an simple example:

LinkedOpacityWidget:
```dart
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
```

LinkedSizeWidget:
```dart
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
```

LinkedOffsetWidget:
```dart
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

```




[package](https://flutter.dev/developing-packages/),

