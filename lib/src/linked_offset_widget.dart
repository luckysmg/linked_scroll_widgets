import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'util.dart';

typedef OnOffsetChanged = Function(double offset);

///
/// A widget that its offsetY value will be linked to a scrollController
///
class LinkedOffsetWidget extends StatefulWidget {
  final Widget child;
  final double originTransitionOffsetY;
  final double finalTransitionOffsetY;
  final double toggleOffsetY;
  final bool transformHitTests;
  final ScrollController scrollController;
  final OnOffsetChanged onOffsetChanged;

  const LinkedOffsetWidget({
    Key key,
    @required this.child,
    @required this.scrollController,
    this.originTransitionOffsetY = 40.0,
    this.finalTransitionOffsetY = 0.0,
    this.toggleOffsetY = kDefaultToggleOffset,
    this.transformHitTests = true,
    this.onOffsetChanged,
  }) : super(key: key);

  @override
  _LinkedTransitionWidgetState createState() => _LinkedTransitionWidgetState();
}

class _LinkedTransitionWidgetState extends State<LinkedOffsetWidget> {
  Offset offset;
  var listener;

  @override
  void didUpdateWidget(LinkedOffsetWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.transformHitTests != oldWidget.transformHitTests ||
        widget.originTransitionOffsetY != oldWidget.originTransitionOffsetY ||
        widget.finalTransitionOffsetY != oldWidget.finalTransitionOffsetY) {
      widget.scrollController.removeListener(listener);
      widget.scrollController.addListener(listener);
    }
  }

  @override
  void initState() {
    super.initState();
    offset = Offset(0, widget.originTransitionOffsetY);
    listener = () {
      var transitionOffsetY = Util.computeTransitionOffset(
          widget.scrollController,
          widget.toggleOffsetY,
          widget.finalTransitionOffsetY,
          widget.originTransitionOffsetY);
      offset = Offset(0, transitionOffsetY);
      if (widget.onOffsetChanged != null) {
        widget.onOffsetChanged(transitionOffsetY);
      }
      setState(() {});
    };
    widget.scrollController.addListener(listener);
  }

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      transformHitTests: widget.transformHitTests,
      offset: offset,
      child: widget.child,
    );
  }

  @override
  void dispose() {
    super.dispose();
    widget.scrollController.removeListener(listener);
  }
}
