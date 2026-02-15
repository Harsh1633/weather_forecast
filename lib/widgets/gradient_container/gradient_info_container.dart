import 'package:flutter/material.dart';
import 'package:weather_forecast/core/colors/app_colors.dart';

class GradientInfoContainer extends StatelessWidget {

  final Widget child;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;

  const GradientInfoContainer({
    super.key,
    required this.child,
    this.width,
    this.height,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.fromLTRB(15, 0, 0, 15),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: const Offset(6, 6),
              blurRadius: 12,
              color: AppColors.tempColor2.withOpacity(0.5),
            ),
            BoxShadow(
              offset: const Offset(-6, -6),
              blurRadius: 12,
              color: AppColors.tempColor1.withOpacity(0.25),
            ),
          ],
          gradient: const LinearGradient(
            colors: [
              AppColors.tempColor1,
              AppColors.tempColor2,
            ],
          ),
          border: Border.all(
            color: AppColors.grayBorder.withOpacity(0.5),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: child,
      ),
    );
  }
}
