import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'linked_opacity_app_bar.dart';
import 'linked_opacity_widget.dart';
import 'util.dart';

const Color _kDefaultNavBarBorderColor = Color(0x4D000000);

const Border _kDefaultNavBarBorder = Border(
  bottom: BorderSide(
    color: _kDefaultNavBarBorderColor,
    width: 0.0, // One physical pixel.
    style: BorderStyle.solid,
  ),
);

///
/// Because the appBar's opacity is often linked with scroll widgets to do some UI effects,
/// so I make widget directly for you to use conveniently.
///
///因为根据滑动来设置appBar的透明度比较常见，索性直接做一个开箱即用的吧^_^
///

///if you want cupertino style please use [LinkedOpacityAppBar]
/// 这是苹果风格的，如果想要谷歌风格的移步 [LinkedOpacityAppBar]
class LinkedOpacityNavigationBar extends StatelessWidget
    implements ObstructingPreferredSizeWidget {
  final ScrollController scrollController;
  final double toggleOffsetY;
  final InitOpacity initOpacity;
  final OnOpacityChanged onOpacityChanged;
  final Widget middle;
  final Widget leading;
  final Widget trailing;
  final Color backgroundColor;
  final bool automaticallyImplyLeading;
  final bool automaticallyImplyMiddle;
  final EdgeInsetsDirectional padding;
  final String previousPageTitle;
  final bool transitionBetweenRoutes;
  final Border border;

  const LinkedOpacityNavigationBar({
    Key key,
    @required this.scrollController,
    this.toggleOffsetY = kDefaultToggleOffset,
    this.initOpacity = InitOpacity.zero,
    this.onOpacityChanged,
    this.middle,
    this.leading,
    this.trailing,
    this.backgroundColor,
    this.automaticallyImplyLeading = true,
    this.automaticallyImplyMiddle = true,
    this.padding,
    this.previousPageTitle,
    this.transitionBetweenRoutes = true,
    this.border = _kDefaultNavBarBorder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LinkedOpacityWidget(
      scrollController: scrollController,
      toggleOffsetY: toggleOffsetY,
      onOpacityChanged: onOpacityChanged,
      initOpacity: initOpacity,
      child: CupertinoNavigationBar(
        trailing: trailing,
        leading: leading,
        middle: middle,
        backgroundColor: backgroundColor,
        automaticallyImplyLeading: automaticallyImplyLeading,
        automaticallyImplyMiddle: automaticallyImplyMiddle,
        padding: padding,
        previousPageTitle: previousPageTitle,
        transitionBetweenRoutes: transitionBetweenRoutes,
        border: border,
      ),
    );
  }

  ///standard iOS navigationBar height
  @override
  Size get preferredSize => Size.fromHeight(44.0);

  @override
  bool shouldFullyObstruct(BuildContext context) {
    final Color backgroundColor =
        CupertinoDynamicColor.resolve(this.backgroundColor, context) ??
            CupertinoTheme.of(context).barBackgroundColor;
    return backgroundColor.alpha == 0xFF;
  }
}
