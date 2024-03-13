import 'package:ayurvedic/presentation/widget/login/custom_button.dart';
import 'package:ayurvedic/presentation/widget/login/custom_text.dart';
import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final VoidCallback onTap;
  const CustomSearchBar({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: width / 1.8,
            child: CustomTextField(
              hintText: 'Search for treatments',
              onTap: onTap,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: CustomButton(
              onPress: onTap,
              buttonLabel: 'search',
              btnHeight: 50,
            ),
          )
        ],
      ),
    );
  }
}
