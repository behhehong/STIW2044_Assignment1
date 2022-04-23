import 'package:flutter/material.dart';
import 'package:currencyconvert/splashscreen.dart';
import 'package:currencyconvert/homepage.dart';

void main() => runApp(const CurrencyConverter());

class CurrencyConverter extends StatelessWidget {
  const CurrencyConverter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen());
  }
}