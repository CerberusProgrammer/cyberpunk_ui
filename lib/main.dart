import 'package:cyberpunk_ui/buttons/cyberpunk_filled_button.dart';
import 'package:cyberpunk_ui/buttons/cyberpunk_outlined_button.dart';
import 'package:cyberpunk_ui/buttons/cyberpunk_text_button.dart';
import 'package:cyberpunk_ui/cards/cyberpunk_filled_card.dart';
import 'package:cyberpunk_ui/cards/cyberpunk_outlined_card.dart';
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
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CyberpunkOutlinedButton(
              text: 'RUN',
              onTap: () {},
            ),
            const SizedBox(height: 8),
            CyberpunkFilledButton(
              text: 'RUN',
              onTap: () {},
            ),
            const SizedBox(height: 8),
            CyberpunkTextButton(
              text: 'RUN',
              onTap: () {},
            ),
            const SizedBox(height: 8),
            const CyberpunkFilledCard(
              title: '01.01.2077',
              subtitle: 'Goodmorning, Night City!',
              content:
                  'Yesterday’s body count lottery rounded out to a solid ‘n’ sturdy thirty!',
              accentColor: Colors.redAccent,
              icon: Icons.abc,
            ),
            const SizedBox(height: 8),
            const CyberpunkOutlinedCard(
              title: '01.01.2077',
              subtitle: 'Goodmorning, Night City!',
              content:
                  'Yesterday’s body count lottery rounded out to a solid ‘n’ sturdy thirty!',
              accentColor: Colors.blueAccent,
            )
          ],
        ),
      ),
    );
  }
}
