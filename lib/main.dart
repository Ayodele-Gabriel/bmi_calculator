import 'package:flutter/material.dart';

import 'views/login_page.dart';

void main() {
  runApp(
    const BMICalc(),
  );
}

class BMICalc extends StatelessWidget {
  const BMICalc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(
          color: Color(0xFF0A0E21),
        ),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      home: LoginPage(),
    );
  }
}