import 'package:flutter/material.dart';

class Led extends StatelessWidget {
  final double width, height;
  final Color color, onColor, offColor;
  final bool isSwitchOn;
  final Duration animationDuration = const Duration(milliseconds: 4000);

  const Led(
      {Key key,
      this.width,
      this.height,
      this.color,
      this.onColor,
      this.offColor,
      this.isSwitchOn})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: width * .1,
      top: height * .35,
      child: AnimatedContainer(
        duration: animationDuration,
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSwitchOn ? onColor : offColor,
        ),
      ),
    );
  }
}
