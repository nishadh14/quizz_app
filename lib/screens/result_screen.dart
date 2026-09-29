import 'package:flutter/material.dart';

import '../theme.dart';
import 'quiz_screen.dart';

class ResultScreen extends StatelessWidget {
  final int score;
  final int total;

  const ResultScreen({super.key, required this.score, required this.total});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: quizAppBar(),
      backgroundColor: backgroundColor,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 200,
                width: 200,
                child: Image.network(
                  "https://cdn.dribbble.com/users/7421625/screenshots/18722898/media/9dc2ccd128c89b19dddd55447ba5e1d0.gif",
                  errorBuilder: (_, __, ___) =>
                      const Icon(Icons.emoji_events, size: 150),
                ),
              ),
              const Text(
                "Congratulations",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 30),
              Text(
                "Score : $score / $total",
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 80),
              SizedBox(
                height: 50,
                width: 200,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: accentColor),
                  onPressed: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const QuizScreen()),
                  ),
                  child: const Text(
                    "Restart",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
