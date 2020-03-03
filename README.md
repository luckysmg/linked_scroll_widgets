Language: [English](https://github.com/luckysmg/linked_scroll_widgets/blob/master/README.md) | [中文简体](https://github.com/luckysmg/linked_scroll_widgets/blob/master/README-CN.md)


# linked_scroll_widgets

A lib full of widgets that can react to the scrollController's offset change,to custom your UI effect.

## Get started with an simple example:

- LinkedOpacityWidget:

![](https://github.com/luckysmg/linked_scroll_widgets/blob/master/gifImage/opacity.gif)
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

- LinkedSizeWidget:

![](https://github.com/luckysmg/linked_scroll_widgets/blob/master/gifImage/size.gif)

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

- LinkedOffsetWidget:

![](https://github.com/luckysmg/linked_scroll_widgets/blob/master/gifImage/offset.gif)

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


## Because the appBar's opacity is often linked with scroll widgets to do some UI effects, so I make widget directly for you to use conveniently.
- LinkedOpacityNavigationBar （iOS style）
- LinkedOpacityAppBar （material style）

## parameter guide：
- toggleOffsetY 
First,the widgets in this lib have this parameter,so you may think that what is toggleOffsetY? 
Let me take an example using the example page call LinkedOpacityPage (just above ,the first GIF)
When the offsetY of your listView is 0(initialOffset) you can't see the title text on top navigationBar
and, when the offsetY = toggleOffset Y ,the title text is visible completely,it a linear change.
In other words,when offsetY = 0 ,the opacity = 0,and when offset = toggleOffset,the opacity = 1.0;
All in all,the faster you want to change your UI effect,the smaller toggleOffsetY you should set;

## FAQ
- When I push a page ,which has a LinkedOffsetWidget or LinkedOpacityWidget in the CupertinoNavigationBar,the effect is strange

Solution:Set parameter "transitionBetweenRoute" to false.


 
## My other packages：
 [jr_extension](https://pub.dev/packages/jr_extension)
 




