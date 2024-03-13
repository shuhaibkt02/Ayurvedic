import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.onTap,
    required this.hintText,
    this.readOnly, this.suffix,
  });

  final VoidCallback? onTap;
  final String hintText;
  final bool? readOnly;
  final Widget? suffix;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Colors.grey.shade400,
          )),
      child: TextFormField(
        readOnly: readOnly ?? false,
        onTap: onTap,
        style: textTheme.bodySmall,
        decoration: InputDecoration(
          suffix: suffix,
          border: InputBorder.none,
          hintText: hintText,
          contentPadding: const EdgeInsets.symmetric(horizontal: 12),
        ),
      ),
    );
  }
}
