import 'package:flashlight/flashlight.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lamp/room/constant.dart';
import 'package:flutter_lamp/room/lamp.dart';
import 'package:flutter_lamp/room/led.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _isSwitchOn = false;
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          LampHangerRope(
            width: w,
            height: h,
            color: darkGray,
          ),
          Led(
            width: w,
            height: h,
            onColor: bulbOnColor,
            offColor: bulbOffColor,
            isSwitchOn: _isSwitchOn,
          ),
          Lamp(
            width: w,
            height: h,
            color: darkGray,
            gradient: bulbOnColor,
            isSwitchOn: _isSwitchOn,
            animationDuration: animationDuration,
          ),
          LampSwitch(
            width: w,
            height: h,
            color: darkGray,
            toggleOnColor: bulbOnColor,
            toggleOffColor: bulbOffColor,
            isSwitchOn: _isSwitchOn,
            animationDuration: animationDuration,
            onTap: () {
              setState(() {
                _isSwitchOn = !_isSwitchOn;
                if (_isSwitchOn) {
                  Flashlight.lightOn();
                } else {
                  Flashlight.lightOff();
                }
              });
            },
          ),
          LampSwitchRope(
            width: w,
            height: h,
            color: darkGray,
            isSwitchOn: _isSwitchOn,
            animationDuration: animationDuration,
          ),
          RoomName(
            width: w,
            height: h,
            color: darkGray,
            isSwitchOn: _isSwitchOn,
            animationDuration: animationDuration,
            roomName: 'Living-Room',
          )
        ],
      ),
    );
  }
}

class LampHangerRope extends StatelessWidget {
  final double width, height;
  final Color color;

  const LampHangerRope(
      {Key key,
      @required this.width,
      @required this.height,
      @required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: width * 0.2,
      child: Container(
        color: color,
        width: 15,
        height: height * 0.15,
      ),
    );
  }
}

class LampSwitch extends StatelessWidget {
  final Function onTap;
  final bool isSwitchOn;
  final Color toggleOnColor, toggleOffColor, color;
  final width, height;
  final Duration animationDuration;

  const LampSwitch({
    Key key,
    this.onTap,
    this.isSwitchOn,
    this.width,
    this.height,
    this.animationDuration,
    this.toggleOnColor,
    this.toggleOffColor,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: height * 0.31,
      width: 30,
      left: width * 0.5 - 15,
      child: GestureDetector(
        onTap: onTap,
        child: Stack(
          children: [
            AnimatedContainer(
              duration: animationDuration,
              width: 30,
              height: 100,
              decoration: BoxDecoration(
                color: bulbOnColor.withOpacity(.4),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            AnimatedPositioned(
              duration: animationDuration,
              left: 0,
              right: 0,
              top: isSwitchOn ? 62 : 8,
              child: Container(
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                ),
                width: 24,
                height: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LampSwitchRope extends StatelessWidget {
  final double width, height;
  final Color color;
  final bool isSwitchOn;
  final Duration animationDuration;

  const LampSwitchRope(
      {Key key,
      this.width,
      this.height,
      this.color,
      this.isSwitchOn,
      this.animationDuration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: animationDuration,
      top: height * 0.4,
      bottom: height * (isSwitchOn ? 0.35 : 0.4),
      width: 2,
      right: width * 0.5 - 1,
      child: Container(
        color: color,
      ),
    );
  }
}

class RoomName extends StatelessWidget {
  final double width, height;
  final Color color;
  final bool isSwitchOn;
  final String roomName;
  final Duration animationDuration;

  const RoomName(
      {Key key,
      this.width,
      this.height,
      this.color,
      this.roomName,
      this.isSwitchOn,
      this.animationDuration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: height * 0.05,
      left: width * .05,
      width: width,
      child: AnimatedContainer(
        duration: animationDuration,
        child: Text(
          roomName.toUpperCase(),
          style: TextStyle(
            color: isSwitchOn ? color.withOpacity(.9) : color.withOpacity(.01),
            fontWeight: FontWeight.w600,
            fontSize: width * .12,
          ),
        ),
      ),
    );
  }
}
