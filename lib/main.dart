import 'package:cyberpunk_ui/v2/cell.dart';
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
            Cell(
              text: 'aas',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
