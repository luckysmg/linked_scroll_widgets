import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'util.dart';

typedef OnSizeChanged = Function(double height, double width);

///
/// A widget that its width or height value will be linked to a scrollController
///
class LinkedSizeWidget extends StatefulWidget {
  final Widget child;
  final ScrollController scrollController;
  final double toggleOffset;
  final double originalHeight;
  final double finalHeight;
  final double originalWidth;
  final double finalWidth;
  final Alignment alignment;
  final OnSizeChanged onSizeChanged;

  /// 如果你想控制高度，那么originalHeight，finalHeight都必须传入，宽度也是如此
  /// if you want to control height value,the [originalHeight] and [finalHeight] needs to be passed in,
  /// so does the width
  const LinkedSizeWidget({
    Key key,
    @required this.scrollController,
    @required this.child,
    this.originalWidth,
    this.finalWidth,
    this.toggleOffset = kDefaultToggleOffset,
    this.originalHeight,
    this.finalHeight,
    this.alignment = Alignment.center,
    this.onSizeChanged,
  }) : super(key: key);

  @override
  _LinkedSizeWidgetState createState() => _LinkedSizeWidgetState();
}

class _LinkedSizeWidgetState extends State<LinkedSizeWidget>
    with SingleTickerProviderStateMixin {
  var currentHeight;
  var currentWidth;
  var listener;

  @override
  void initState() {
    super.initState();
    initSize();
    listener = () {
      if (widget.originalWidth != null && widget.finalWidth != null) {
        currentWidth = Util.computeSize(widget.scrollController,
            widget.toggleOffset, widget.originalWidth, widget.finalWidth);
      }
      if (widget.originalHeight != null && widget.finalHeight != null) {
        currentHeight = Util.computeSize(widget.scrollController,
            widget.toggleOffset, widget.originalHeight, widget.finalHeight);
      }
      if (widget.onSizeChanged != null) {
        widget.onSizeChanged(currentHeight, currentWidth);
      }
      setState(() {});
    };
    widget.scrollController.addListener(listener);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: widget.alignment,
      height: currentHeight,
      width: currentWidth,
      child: widget.child,
    );
  }

  @override
  void dispose() {
    super.dispose();
    widget.scrollController.removeListener(listener);
  }

  @override
  void didUpdateWidget(LinkedSizeWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.originalHeight != widget.originalHeight ||
        oldWidget.finalHeight != widget.finalHeight ||
        oldWidget.originalWidth != widget.originalWidth ||
        oldWidget.finalWidth != widget.finalWidth) {
      initSize();
      widget.scrollController.removeListener(listener);
      widget.scrollController.addListener(listener);
    }
  }

  void initSize() {
    currentWidth = widget.originalWidth;
    currentHeight = widget.originalHeight;
  }
}
