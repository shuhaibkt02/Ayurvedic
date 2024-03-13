import 'package:ayurvedic/presentation/widget/login/custom_button.dart';
import 'package:ayurvedic/presentation/widget/login/custom_logo.dart';
import 'package:ayurvedic/presentation/widget/login/custom_textfield.dart';
import 'package:ayurvedic/presentation/widget/login/text_terms.dart';
import 'package:ayurvedic/utils/constant.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    final textTheme = Theme.of(context).textTheme;
    ScrollController scrollController = ScrollController();
    GlobalKey formKey = GlobalKey<FormState>();
    return Scaffold(
      body: SingleChildScrollView(
        controller: scrollController,
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LogoWidget(width: width),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
                child: Text(loginTitle,
                    style: textTheme.bodyLarge, textAlign: TextAlign.start),
              ),
              CustomFormField(
                label: 'Email',
                hintText: 'Enter your email',
                onTap: () {
                  scrollController.jumpTo(100);
                },
              ),
              CustomFormField(
                label: 'Password',
                hintText: 'Enter password',
                isObscure: true,
                onTap: () {
                  scrollController.jumpTo(200);
                },
              ),
              SizedBox(height: width / 5.6),
              Center(
                child: CustomButton(
                  onPress: () {},
                  buttonLabel: 'Login',
                ),
              ),
              SizedBox(height: width / 7),
              TextTermsPrivacy(textTheme: textTheme),
            ],
          ),
        ),
      ),
    );
  }
}
