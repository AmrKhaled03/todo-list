import 'package:flutter/material.dart';
import 'package:todo/constants/strings.dart';
import 'package:todo/views/screens/details.dart';
import 'package:todo/views/screens/home.dart';
import 'package:todo/views/screens/splash.dart';

void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {



    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        AppStrings.homeRoute: (context) => const HomeScreen(),
        AppStrings.splashRoute: (context) => const SplashScreen(),
        AppStrings.detailsRoute: (context) => const DetailsScreen(),
      },
      initialRoute: AppStrings.splashRoute,
    );
  }
}
