import 'package:ayurvedic/utils/constant.dart';
import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final String label;
  final String? hintText;
  final VoidCallback? onTap;
  final bool? isObscure;
  final bool? noTitle;
  final Widget? suffix;
  final TextInputType? keyboardType;
  final Widget? child;
  final TextEditingController? controller;
  const CustomFormField({
    super.key,
    required this.label,
    this.hintText,
    this.onTap,
    this.isObscure,
    this.noTitle,
    this.child,
    this.keyboardType,
    this.suffix, this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
            child: Text(label, style: textTheme.bodyMedium),
          ),
          child ??
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                    color: textFieldBgColor,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.grey.shade400,
                    )),
                child: TextFormField(
                  controller: controller,
                  autofocus: true,
                  focusNode: FocusNode(),
                  keyboardType: keyboardType,
                  obscureText: isObscure ?? false,
                  onTap: onTap,
                  style: textTheme.bodySmall,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    suffix: suffix,
                    hintText: hintText ?? '',
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                  ),
                ),
              ),
        ],
      ),
    );
  }
}
