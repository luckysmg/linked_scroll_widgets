import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../linked_scroll_widgets.dart';
import 'util.dart';

///
/// Because the appBar's opacity is often linked with scroll widgets to do some UI effects,
/// so I make widget directly for you to use conveniently.
///
///因为根据滑动来设置appBar的透明度比较常见，索性直接做一个开箱即用的吧^_^
///

///Material style appbar with linked opacity widget.
///if you want iOS style please use [LinkedOpacityNavigationBar]
/// 这是谷歌风格的，如果想要苹果风格的移步 [LinkedOpacityNavigationBar]
class LinkedOpacityAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final ScrollController scrollController;
  final double toggleOffsetY;
  final Widget title;
  final List<Widget> actions;
  final Widget leading;
  final bool automaticallyImplyLeading;
  final Widget flexibleSpace;
  final Color backgroundColor;
  final double elevation;
  final bool primary;
  final PreferredSizeWidget bottom;
  final IconThemeData actionsIconTheme;
  final ShapeBorder shape;
  final double titleSpacing;
  final Brightness brightness;
  final bool centerTitle;
  final IconThemeData iconTheme;
  final InitOpacity initOpacity;
  final OnOpacityChanged onOpacityChanged;

  const LinkedOpacityAppBar({
    Key key,
    @required this.scrollController,
    this.title,
    this.actions,
    this.toggleOffsetY = kDefaultToggleOffset,
    this.automaticallyImplyLeading = true,
    this.flexibleSpace,
    this.backgroundColor = Colors.white,
    this.elevation = 0.0,
    this.leading,
    this.primary = true,
    this.bottom,
    this.actionsIconTheme,
    this.shape,
    this.titleSpacing = NavigationToolbar.kMiddleSpacing,
    this.brightness,
    this.centerTitle,
    this.iconTheme,
    this.initOpacity = InitOpacity.zero,
    this.onOpacityChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LinkedOpacityWidget(
      scrollController: scrollController,
      toggleOffsetY: toggleOffsetY,
      initOpacity: initOpacity,
      onOpacityChanged: onOpacityChanged,
      child: AppBar(
        elevation: elevation,
        leading: leading,
        primary: primary,
        bottom: bottom,
        brightness: brightness,
        shape: shape,
        centerTitle: centerTitle,
        iconTheme: iconTheme,
        titleSpacing: titleSpacing,
        actionsIconTheme: actionsIconTheme,
        backgroundColor: backgroundColor,
        flexibleSpace: flexibleSpace,
        title: title,
        actions: actions,
        automaticallyImplyLeading: automaticallyImplyLeading,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
