

import 'package:flutter/material.dart';

class SuccessWidget extends StatefulWidget {
  Widget? child;
  SuccessWidget({required this.child}): super();

  @override
  SuccessWidgetState createState() =>
      SuccessWidgetState();

}

class SuccessWidgetState extends State<SuccessWidget> with SingleTickerProviderStateMixin{

  AnimationController? _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(duration: const Duration(milliseconds: 700), vsync: this);
    _controller!.repeat(reverse: true);
  }

  @override
  void dispose(){
    this._controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: Tween(begin: 0.75, end: 2.0)
          .animate(CurvedAnimation(
          parent: _controller!,
          curve: Curves.elasticOut
      )),
      child: widget.child,);
  }
}