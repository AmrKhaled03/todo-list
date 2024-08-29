import 'package:flutter/material.dart';
import 'package:todo/constants/colors.dart';
import 'package:lottie/lottie.dart';
import 'package:todo/constants/strings.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
@override
void initState() {
  super.initState();
  Future.delayed(
    const Duration(seconds: 4),
    () {
      if (mounted) {
        debugPrint("Navigating to home screen");
        Navigator.pushReplacementNamed(context, AppStrings.homeRoute);
      }
    },
  );
}


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Todo List ",
                  style: TextStyle(
                      color: AppColors.logoColor,
                      fontSize: 50,
                      fontWeight: FontWeight.w900),
                ),
                const SizedBox(
                  height: 10,
                ),
                Lottie.asset(
                  "assets/jsons/Animation - 1724950152231.json",
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
