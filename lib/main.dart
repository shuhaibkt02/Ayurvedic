import 'package:ayurvedic/presentation/screen/register_screen.dart';
import 'package:ayurvedic/utils/constant.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ayurvedic Center',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: buttonBackground),
        useMaterial3: true,
        textTheme: textTheme,
      ),
      home: const RegisterScreen(),
    );
  }
}
