import 'dart:math';
import 'package:duseca_calender_app/AppConstant/app_constant.dart';
import 'package:flutter/material.dart';

class CircularProgressIndicatorWidget extends StatelessWidget {
  final double progress;

  const CircularProgressIndicatorWidget({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 250,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          CustomPaint(
            painter: CircularProgressPainter(progress),
            child: Center(
              child: Image.asset(
                "assets/images/Group.png",
              ),
            ),
          ),
          Positioned(
            top: 100,
            left: -18,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: const ShapeDecoration(
                color: Color(0xFFFCFCFC),
                shape: CircleBorder(
                  side: BorderSide(width: 1, color: Colors.white),
                ),
                shadows: [
                  BoxShadow(
                    color: Color(0x19000000),
                    blurRadius: 25,
                    offset: Offset(4, 8),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Center(
                child: Text(
                  '${(100 - progress).toInt()}%',
                  style: kStyleBlack15400,
                ),
              ),
            ),
          ),
          Positioned(
            top: 100,
            right: -20,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: const ShapeDecoration(
                color: Color(0xFFFCFCFC),
                shape: CircleBorder(
                  side: BorderSide(width: 1, color: Colors.white),
                ),
                shadows: [
                  BoxShadow(
                    color: Color(0x19000000),
                    blurRadius: 25,
                    offset: Offset(4, 8),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Center(
                child: Text(
                  '${(progress).toInt()}%',
                  style: kStyleBlack15400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CircularProgressPainter extends CustomPainter {
  final double progress;
  final double strokeWidth;

  CircularProgressPainter(this.progress, {this.strokeWidth = 10.0});

  @override
  void paint(Canvas canvas, Size size) {
    Paint emptyArcPaint = Paint()
      ..color = const Color(0xFFFFD422)
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Paint filledArcPaint = Paint()
      ..color = const Color(0xff826AF9)
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    double radius = (size.width - strokeWidth) / 2;
    Offset center = Offset(size.width / 2, size.height / 2);

    canvas.drawCircle(center, radius, emptyArcPaint);

    double angle = 2 * pi * (progress / 100);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      angle,
      false,
      filledArcPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
