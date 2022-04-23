import 'dart:async';

import 'package:flutter/material.dart';
import 'package:currencyconvert/homepage.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

void main() => runApp(SplashScreen());

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 4),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (content) => Homepage())));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/logo.png", scale: 3),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 35,
                    color: Color(0xFFFFB74D),
                    shadows: [
                      Shadow(
                        blurRadius: 7.0,
                        color: Color(0xFFFFB74D),
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                  child: Center(
                    child: AnimatedTextKit(
                      repeatForever: true,
                      animatedTexts: [
                        FlickerAnimatedText('Loading'),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 163, 19, 189),
      ),
    );
  }
}
