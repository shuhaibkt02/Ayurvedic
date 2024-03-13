import 'package:ayurvedic/data/repo/auth/auth_repo.dart';
import 'package:ayurvedic/logic/auth/auth_bloc.dart';
import 'package:ayurvedic/presentation/screen/details_screen.dart';
// import 'package:ayurvedic/presentation/screen/login_screen.dart';
import 'package:ayurvedic/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(authRepository: AuthRepository()),
      child: MaterialApp(
        title: 'Ayurvedic Center',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: buttonBackground),
          useMaterial3: true,
          textTheme: textTheme,
        ),
        home: const DetailPage(),
      ),
    );
  }
}
