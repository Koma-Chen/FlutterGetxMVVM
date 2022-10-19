import 'package:flutter/material.dart';

class MyGestureDetector extends StatefulWidget {
  final VoidCallback? onTap;
  final Widget child;
  final int? period;
  final HitTestBehavior? behavior;
  final GestureLongPressCallback? onLongPress;
  final GestureLongPressStartCallback? onLongPressStart;
  final GestureLongPressEndCallback? onLongPressEnd;
  final GestureTapDownCallback? onTapDown;
  final GestureDragUpdateCallback? onPanUpdate;
  final GestureDragEndCallback? onPanEnd;
  final GestureTapUpCallback? onTapUp;
  final GestureDragDownCallback? onPanDown;

  const MyGestureDetector(
      {Key? key,
      required this.onTap,
      required this.child,
      this.period,
      this.behavior,
      this.onLongPress,
      this.onLongPressStart,
      this.onLongPressEnd,
      this.onTapDown,
      this.onPanUpdate,
      this.onPanEnd,
      this.onTapUp,
      this.onPanDown})
      : super(key: key);

  @override
  MyGestureDetectorState createState() => MyGestureDetectorState();
}

class MyGestureDetectorState extends State<MyGestureDetector> {
  DateTime lastActionTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          final time = DateTime.now().millisecondsSinceEpoch -
              lastActionTime.millisecondsSinceEpoch;
          if (time > 1000) {
            widget.onTap?.call();
            lastActionTime = DateTime.now();
          }
        },
        behavior: widget.behavior,
        onLongPress: widget.onLongPress,
        onLongPressStart: widget.onLongPressStart,
        onLongPressEnd: widget.onLongPressEnd,
        onTapDown: widget.onTapDown,
        onPanUpdate: widget.onPanUpdate,
        onPanEnd: widget.onPanEnd,
        onTapUp: widget.onTapUp,
        onPanDown: widget.onPanDown,
        child: Container(child: widget.child));
  }
}
