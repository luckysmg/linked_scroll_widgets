Language: [English](https://github.com/luckysmg/linked_scroll_widgets/blob/master/README.md) | [中文简体](https://github.com/luckysmg/linked_scroll_widgets/blob/master/README-CN.md)


# linked_scroll_widgets

一个可以和scrollController交互的一个组件库

## 别的不说，直接上例子

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
## 由于透明度变换常常和AppBar关联，索性封装了两个组件，开箱即用
- LinkedOpacityNavigationBar （cupertino风格）
- LinkedOpacityAppBar （material风格）

## 参数说明：toggleOffsetY

- 首先此包中的组件都包含这个属性，那什么是toggleOffsetY？
 这个是一个滚动的临界值，当你的滚动明组件（如listView）的滚动offset达到了这个值，你的相关联的UI效果也会达到边界值
 
 这里以上面 LinkedOpacityPage 中的例子为例，
 具体情况如下：当你listView处于初始位置（offsetY = 0)时，你是完全看不见导航栏上的字的，当滚动到临界值，也就是
 offsetY = toggleOffsetY 时，你导航栏上的字才能完全显示出来，也就是说这个一个对应的线性变化。
 
 也就是说，当你滚动的offsetY = 0和 offsetY = toggleOffsetY时,分别达到两端的临界值.
 
 一句话来说，如果你想要你的UI效果变化的快，就把 toggleOffsetY设定得越小即可(toggleOffsetY > 0).
 
 
 


