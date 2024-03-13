import 'package:flutter/material.dart';
import 'package:ayurvedic/utils/constant.dart';

class TextTermsPrivacy extends StatelessWidget {
  const TextTermsPrivacy({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    const String loginTerm =
        'By creating or logging into an account, you are agreeing ';

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Text(
            loginTerm,
            style: textTheme.bodySmall,
            textAlign: TextAlign.center,
          ),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: textTheme.bodySmall,
              children: const [
                TextSpan(text: 'with our '),
                TextSpan(
                  text: 'Terms and Conditions',
                  style: TextStyle(color: linkText),
                ),
                TextSpan(text: ' and '),
                TextSpan(
                  text: 'Privacy Policy',
                  style: TextStyle(color: linkText),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
