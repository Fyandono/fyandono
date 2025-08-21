import 'package:flutter/material.dart';
import 'package:fyandono/colors/colors.dart';
import 'dart:math';

import 'package:fyandono/widgets/text.dart';

class SwimmingWidget extends StatefulWidget {
  const SwimmingWidget({super.key});

  @override
  State<SwimmingWidget> createState() => _SwimmingWidgetState();
}

class _SwimmingWidgetState extends State<SwimmingWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final double widgetWidth = 320;
  final double widgetHeight = 150;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(); // continuous wave
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widgetWidth,
      height: widgetHeight,
      child: Stack(
        children: [
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return CustomPaint(
                size: Size(widgetWidth, widgetHeight),
                painter: _WaveWithShadowPainter(_controller.value),
              );
            },
          ),
          // Swimmer stays in place
          Positioned(
            left: widgetWidth / 2 - 16,
            top: widgetHeight / 2 - 16,
            child: MyText(text: "🏊‍♂️", fontSize: 38),
          ),
        ],
      ),
    );
  }
}

class _WaveWithShadowPainter extends CustomPainter {
  final double animationValue;
  _WaveWithShadowPainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final double waveHeight = 10.0;
    final double waveLength = size.width / 2;

    // Shadow paint
    final shadowPaint =
        Paint()
          ..color = AppColors.grey400
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8);

    final shadowPath = Path();
    shadowPath.moveTo(0, size.height / 2 + waveHeight + 4);
    for (double x = 0; x <= size.width; x++) {
      double y =
          waveHeight * sin((2 * pi / waveLength) * x + animationValue * 2 * pi);
      shadowPath.lineTo(x, size.height / 2 + y + 4);
    }
    shadowPath.lineTo(size.width, size.height);
    shadowPath.lineTo(0, size.height);
    shadowPath.close();
    canvas.drawPath(shadowPath, shadowPaint);

    // Wave paint
    final wavePaint = Paint()..color = AppColors.blueWater;
    final wavePath = Path();
    wavePath.moveTo(0, size.height / 2);
    for (double x = 0; x <= size.width; x++) {
      double y =
          waveHeight * sin((2 * pi / waveLength) * x + animationValue * 2 * pi);
      wavePath.lineTo(x, size.height / 2 + y);
    }
    wavePath.lineTo(size.width, size.height);
    wavePath.lineTo(0, size.height);
    wavePath.close();
    canvas.drawPath(wavePath, wavePaint);
  }

  @override
  bool shouldRepaint(covariant _WaveWithShadowPainter oldDelegate) => true;
}
