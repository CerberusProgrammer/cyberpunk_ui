import 'package:cyberpunk_ui/v2/button/filled/cyber_filled_button.dart';
import 'package:cyberpunk_ui/v2/button/cyber_button_shape.dart';
import 'package:cyberpunk_ui/v2/button/text/cyber_text_button.dart';
import 'package:cyberpunk_ui/v2/progress/cyber_linear_progress.dart';
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
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  CyberFilledButton(
                    icon: Icons.ac_unit,
                    text: 'cancelar',
                    onTap: () {},
                    borderType: CyberBorderType.left,
                  ),
                  CyberFilledButton(
                    icon: Icons.ac_unit,
                    text: 'aceptar',
                    onTap: () {},
                    borderType: CyberBorderType.right,
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: CyberTextButton(
                      icon: Icons.arrow_back_ios,
                      onTap: () {},
                      borderType: CyberBorderType.left,
                    ),
                  ),
                  CyberTextButton(
                    icon: Icons.arrow_forward_ios,
                    onTap: () {},
                    borderType: CyberBorderType.right,
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: CyberTextButton(
                      title: 'BACK',
                      onTap: () {},
                      borderType: CyberBorderType.left,
                    ),
                  ),
                  Expanded(
                    child: CyberTextButton(
                      title: 'NEXT',
                      onTap: () {},
                      borderType: CyberBorderType.right,
                    ),
                  ),
                ],
              ),
              CyberLinearProgress(
                title: Text('Loading...'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
