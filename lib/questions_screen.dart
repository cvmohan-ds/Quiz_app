import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_quiz/answer_button.dart';
import 'package:flutter_quiz/data/questions.dart';

class QuestionsScreen extends StatefulWidget{
  const QuestionsScreen({super.key, required this.onAnswerSubmit});

  final void Function(int) onAnswerSubmit;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();

}

class _QuestionsScreenState extends State<QuestionsScreen> {

  int currentQuestionIndex = 0;

  void nextQuestion(answerIndex) {
    widget.onAnswerSubmit(answerIndex);
    setState(() {
      if (currentQuestionIndex < questions.length - 1) {
        currentQuestionIndex++;
      }
      
    });
  }

  @override
  Widget build(BuildContext context) {
    var currentQuestion = questions[currentQuestionIndex];
    List<int> indices = [];
    for (var i =0 ; i < currentQuestion.answers.length; i++) {
      indices.add(i);
    }
    indices.shuffle();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          currentQuestion.question,
          textAlign: TextAlign.center,
          style: GoogleFonts.oswald(
            color: const Color.fromARGB(255, 186, 139, 248),
            fontSize: 24,
           ),
        ),
        const SizedBox(height: 20),
        for (var i=0; i < indices.length; i++)
          AnswerButton(currentQuestion.answers[indices[i]], 
          () {
            nextQuestion(indices[i]);
          }),
      ],
    );
  }
}