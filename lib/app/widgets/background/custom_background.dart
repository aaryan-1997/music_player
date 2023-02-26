import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:music_app/app/ui/theme/colors.dart';
import 'package:music_app/app/widgets/background/circle_blur_painter.dart';

class CustomBackground extends StatelessWidget {
  const CustomBackground({Key? key, required this.child}) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.backgroundColor,
      child: Stack(
        children: [
          Positioned(
            bottom: 150.r,
            left: 30.r,
            child: CustomPaint(
              foregroundPainter: CircleBlurPainter(
                circleWidth: 150.r,
                blurSigma: 100.r,
                circleColor: AppColor.accentColor.withOpacity(0.3),
              ),
            ),
          ),
          Positioned(
            top: 150.r,
            right: 30.r,
            child: CustomPaint(
              foregroundPainter: CircleBlurPainter(
                circleWidth: 150.r,
                blurSigma: 100.r,
                circleColor: AppColor.primaryColor.withOpacity(0.3),
              ),
            ),
          ),
          //
          child
        ],
      ),
    );
  }
}
