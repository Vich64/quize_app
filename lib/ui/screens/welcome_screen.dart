import 'package:flutter/material.dart';
import '../widgets/app_button.dart';

class WelcomeScreen extends StatelessWidget {
  final VoidCallback onStart;
  const WelcomeScreen({super.key, required this.onStart});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(),
        Image.asset(
          'assets/quiz-logo.png',
          width: 160,
          color: Colors.white.withOpacity(0.9),
          colorBlendMode: BlendMode.modulate,
        ),
        const SizedBox(height: 20),
        const Text(
          'Flutter Quiz',
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        AppButton('Start Quiz', onTap: onStart, icon: Icons.play_arrow_rounded),
        const SizedBox(height: 40),
      ],
    );
  }
}
