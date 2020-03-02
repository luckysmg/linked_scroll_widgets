import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'util.dart';

///初始状态的opacity
///init Opacity
enum InitOpacity {
  ///1.0
  one,

  ///0.0
  zero
}

typedef OnOpacityChanged = Function(double opacity);

///
/// A widget that its opacity value will be linked to a scrollController
///
class LinkedOpacityWidget extends StatefulWidget {
  final Widget child;
  final ScrollController scrollController;
  final double toggleOffsetY;
  final InitOpacity initOpacity;
  final OnOpacityChanged onOpacityChanged;

  const LinkedOpacityWidget(
      {Key key,
      @required this.child,
      @required this.scrollController,
      this.toggleOffsetY = kDefaultToggleOffset,
      this.initOpacity = InitOpacity.zero,
      this.onOpacityChanged})
      : super(key: key);

  @override
  _LinkedOpacityWidgetState createState() => _LinkedOpacityWidgetState();
}

class _LinkedOpacityWidgetState extends State<LinkedOpacityWidget> {
  var opacity;
  VoidCallback listener;

  @override
  void initState() {
    super.initState();
    initOpacity();
    listener = () {
      opacity = Util.computeOpacityWithOffset(
          widget.scrollController, widget.toggleOffsetY, widget.initOpacity);
      if (widget.onOpacityChanged != null) {
        widget.onOpacityChanged(opacity);
      }
      setState(() {});
    };

    widget.scrollController.addListener(listener);
  }

  @override
  void didUpdateWidget(LinkedOpacityWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initOpacity != oldWidget.initOpacity ||
        widget.toggleOffsetY != oldWidget.toggleOffsetY) {
      initOpacity();
      widget.scrollController.removeListener(listener);
      widget.scrollController.addListener(listener);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: opacity,
      duration: const Duration(),
      child: widget.child,
    );
  }

  void initOpacity() {
    if (widget.initOpacity == InitOpacity.zero) {
      opacity = 0.0;
    } else {
      opacity = 1.0;
    }
  }

  @override
  void dispose() {
    super.dispose();
    widget.scrollController.removeListener(listener);
  }
}
