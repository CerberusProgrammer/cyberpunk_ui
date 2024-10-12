import 'package:cyberpunk_ui/v2/button/filled/cyber_filled_button.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: Scaffold(
        body: Column(
          children: [
            CyberFilledButton(text: 'a', onTap: () {}),
            CyberFilledButton(text: 'aa', onTap: () {}),
            CyberFilledButton(text: 'aaa', onTap: () {}),
            CyberFilledButton(text: 'aaaaaaaaa', onTap: () {}),
            CyberFilledButton(
                icon: Icons.ac_unit, text: 'aceptar', onTap: () {}),
            CyberFilledButton(
                icon: Icons.ac_unit, text: 'aceptar', onTap: () {}),
          ],
        ),
      ),
    );
  }
}
