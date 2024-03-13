import 'package:ayurvedic/logic/auth/auth_bloc.dart';
import 'package:ayurvedic/presentation/screen/home_screen.dart';
import 'package:ayurvedic/presentation/widget/login/custom_button.dart';
import 'package:ayurvedic/presentation/widget/login/custom_logo.dart';
import 'package:ayurvedic/presentation/widget/login/custom_textfield.dart';
import 'package:ayurvedic/presentation/widget/login/text_terms.dart';
import 'package:ayurvedic/utils/constant.dart';
import 'package:ayurvedic/utils/extenstion/nav_extenstion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    final textTheme = Theme.of(context).textTheme;
    ScrollController scrollController = ScrollController();
    TextEditingController userController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
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
                controller: userController,
                onTap: () {
                  scrollController.jumpTo(100);
                },
              ),
              CustomFormField(
                label: 'Password',
                hintText: 'Enter password',
                controller: passwordController,
                isObscure: true,
                onTap: () {
                  scrollController.jumpTo(200);
                },
              ),
              SizedBox(height: width / 5.6),
              Center(
                child: BlocListener<AuthBloc, AuthState>(
                  listener: (context, state) {
                    if (state is Authenticated) {
                      Navigator.of(context)
                          .pushAndRemoveUntilPage(const HomeScreen());
                    }
                    if (state is AuthError) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(state.errorMessage)));
                    }
                  },
                  child: CustomButton(
                    onPress: () {
                      // ignore: unused_local_variable
                      final username = userController.text.trim();
                      // ignore: unused_local_variable
                      final password = passwordController.text.trim();

                      print('$username $password');
                      context.read<AuthBloc>().add(
                          Authenticate(username: username, password: password));

                      // userController.clear();
                      // passwordController.clear();
                    },
                    buttonLabel: 'Login',
                  ),
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
