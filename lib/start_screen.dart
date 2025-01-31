import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/quiz-logo.png",
        ),
        Text(
          "Learn Flutter the Fun Way!!!",
          style: GoogleFonts.aladin(
            color: const Color.fromARGB(255, 161, 208, 243),
            fontSize: 28,
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton.icon(
          onPressed: startQuiz,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 2, 41, 66),
            foregroundColor: Colors.white,
          ),
          icon: const Icon(Icons.play_arrow, size: 24),
          label: Text(
            "Start Quiz!",
            style: GoogleFonts.oswald(fontSize: 22),
          ),
        ),
      ],
    );
  }
}
