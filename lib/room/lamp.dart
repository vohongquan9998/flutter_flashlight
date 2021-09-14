import 'package:flutter/material.dart';

class Lamp extends StatelessWidget {
  final double width, height;
  final Color color, gradient;
  final bool isSwitchOn;
  final Duration animationDuration;

  const Lamp(
      {Key key,
      this.width,
      this.height,
      this.color,
      this.gradient,
      this.isSwitchOn,
      this.animationDuration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: -width * .95,
      top: height * .15,
      width: width * 2.1,
      child: ClipPath(
        clipper: ClipWidget(),
        child: Column(
          children: [
            Container(
              height: height * .25,
              color: color,
              // child: Padding(
              //   padding: EdgeInsets.only(left: width * .25),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       RoundContainer(
              //         color: Colors.amber,
              //         onTap: () {},
              //       ),
              //       SizedBox(
              //         width: width * .02,
              //       ),
              //       RoundContainer(
              //         color: Colors.red,
              //         onTap: () {},
              //       ),
              //       SizedBox(
              //         width: width * .02,
              //       ),
              //       RoundContainer(
              //         color: Colors.purple,
              //         onTap: () {},
              //       ),
              //     ],
              //   ),
              // ),
            ),
            AnimatedContainer(
              duration: animationDuration,
              height: height * .75,
              decoration: BoxDecoration(
                  gradient: isSwitchOn
                      ? LinearGradient(
                          colors: [
                            gradient.withOpacity(.4),
                            gradient.withOpacity(.01)
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        )
                      : null),
            ),
          ],
        ),
      ),
    );
  }
}

class RoundContainer extends StatelessWidget {
  final Color color;
  final Function onTap;
  RoundContainer({this.color, this.onTap});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}

class ClipWidget extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(size.width * 0.3, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width * 0.7, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
