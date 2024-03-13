import 'package:ayurvedic/utils/constant.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPress;
  final Color? btnColor;
  final double? width;
  final double? btnHeight;
  final String buttonLabel;
  const CustomButton({
    super.key,
    required this.onPress,
    required this.buttonLabel,
    this.width,
    this.btnHeight,
    this.btnColor,
  });

  @override
  Widget build(BuildContext context) {
    double mediaWidth = MediaQuery.sizeOf(context).width;
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
      child: ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
            alignment: Alignment.center,
            fixedSize: Size(width ?? mediaWidth, btnHeight ?? 55),
            backgroundColor: btnColor ?? buttonBackground,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
        child: Text(
          textAlign: TextAlign.center,
          buttonLabel,
          style: textTheme.bodyMedium?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
