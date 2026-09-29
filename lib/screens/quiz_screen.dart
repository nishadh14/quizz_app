import 'package:flutter/material.dart';

import '../data/questions.dart';
import '../theme.dart';
import 'result_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int index = 0;
  int selected = -1;
  int score = 0;

  void select(int option) {
    if (selected != -1) return; // already answered
    setState(() {
      selected = option;
      if (option == questions[index].correctIndex) score++;
    });
  }

  void next() {
    if (selected == -1) return; // must answer first
    if (index < questions.length - 1) {
      setState(() {
        index++;
        selected = -1;
      });
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (_) =>
                ResultScreen(score: score, total: questions.length)),
      );
    }
  }

  Color? optionColor(int option) {
    if (selected == -1) return null;
    if (option == questions[index].correctIndex) return Colors.green;
    if (option == selected) return Colors.red;
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[index];
    return Scaffold(
      appBar: quizAppBar(),
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 60),
            Text(
              "Questions : ${index + 1} / ${questions.length}",
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 60),
            Text(
              question.text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(201, 105, 3, 146)),
            ),
            const SizedBox(height: 50),
            for (int i = 0; i < question.options.length; i++) ...[
              SizedBox(
                height: 60,
                width: 350,
                child: ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: optionColor(i)),
                  onPressed: () => select(i),
                  child: Text(
                    "${String.fromCharCode(65 + i)}. ${question.options[i]}",
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: accentColor,
        onPressed: next,
        child: const Icon(Icons.forward, color: Colors.white),
      ),
    );
  }
}
