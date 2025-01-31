import 'package:flutter/material.dart';
import 'package:flutter_quiz/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(this.submittedAnswers, this.onPlayAgain, {super.key});
  final List<int> submittedAnswers;
  final void Function() onPlayAgain;

  @override
  Widget build(BuildContext context) {
    int score = 0;
    List<ResultInfo> results = [];
    for (var i = 0; i < submittedAnswers.length; i++) {
      results.add(ResultInfo(questions[i].question, submittedAnswers[i] == 0,
          questions[i].answers[0], questions[i].answers[submittedAnswers[i]]));
      if (submittedAnswers[i] == 0) {
        score++;
      }
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "Your score is $score",
          textAlign: TextAlign.center,
          style: GoogleFonts.oswald(fontSize: 28, color: const Color.fromARGB(255, 124, 249, 107)),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 400,
          width: double.infinity,
          child: ListView.builder(
            itemCount: results.length,
            itemBuilder: (context, index) {
              return SingleResultDisplay(results[index]);
            },
          ),
        ),
        const SizedBox(height: 40),
        ElevatedButton(
          onPressed: onPlayAgain,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 2, 41, 66),
            foregroundColor: Colors.white,
          ),
          child: const Text("Restart Quiz"),
        ),
      ],
    );
  }
}

class ResultInfo {
  final String question;
  final bool isCorrect;
  final String correctAnswer;
  final String yourAnswer;
  ResultInfo(
      this.question, this.isCorrect, this.correctAnswer, this.yourAnswer);
}

class SingleResultDisplay extends StatelessWidget {
  const SingleResultDisplay(this.result, {super.key});
  final ResultInfo result;

  @override
  Widget build(context) {
    return Column(
      
      children: [
        Text(result.question,
            style: GoogleFonts.oswald(
              fontSize: 20,
              color: Colors.white,
            )),
        Text("Correct Answer: ${result.correctAnswer}",
            style: GoogleFonts.oswald(
              fontSize: 14,
              color: Colors.white,
            )),
        Text("Your Answer: ${result.yourAnswer}",
            style: GoogleFonts.oswald(
              fontSize: 14,
              color: result.correctAnswer == result.yourAnswer? const Color.fromARGB(255, 31, 209, 150): const Color.fromARGB(255, 225, 235, 120),
            )),
        Text(result.isCorrect ? "Correct" : "Incorrect",
            style: GoogleFonts.oswald(
              fontSize: 12,
              color: result.correctAnswer == result.yourAnswer? const Color.fromARGB(255, 31, 209, 150): const Color.fromARGB(255, 221, 240, 128),
            )),
      ],
    );
  }
}
