import 'package:flutter/material.dart';

class AnimationView extends StatefulWidget {
  final Function onTab;
  final Widget child;
  final bool isDelayed;

  const AnimationView({
    Key? key,
    required this.child,
    required this.onTab,
    this.isDelayed = false,
  }) : super(key: key);

  @override
  _AnimationViewState createState() => _AnimationViewState();
}

class _AnimationViewState extends State<AnimationView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 100,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1 - _controller.value,
      child: GestureDetector(
        onTap: () async {
          _controller.forward().then((value) => _controller.reverse());
          if (widget.isDelayed)
            await Future.delayed(Duration(milliseconds: 195));
          widget.onTab();
        },
        child: widget.child,
      ),
    );
  }
}
