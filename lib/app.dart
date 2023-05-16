import 'package:flutter/material.dart';
// import 'package:flutter_class_test/model/view/login.dart';
import 'package:flutter_class_test/view/dashboard.dart';
import 'package:flutter_class_test/view/login.dart';
import 'package:flutter_class_test/view/signup.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/loginRoute',
      routes: {
        '/loginRoute': (context) => const LoginView(),
        '/registerRoute': (context) => const RegisterView(),
        '/dashboardRoute':(context) => const DashboardView(),
      },
    );
  }
}
