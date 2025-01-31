import 'package:flutter/material.dart';

import 'package:flutter_quiz/start_screen.dart';
import 'package:flutter_quiz/questions_screen.dart';
import 'package:flutter_quiz/data/questions.dart';
import 'package:flutter_quiz/result_screen.dart';

class Quiz extends StatefulWidget{
const Quiz({super.key});

@override
State<Quiz> createState() => _QuizState();

}

class _QuizState extends State<Quiz> {

  String currentScreen = "start";

  void startQuiz() {
    setState(() {
      currentScreen = "questions";
    });
  }
  final List<int> submittedAnswers = [];
  void onAnswerSubmit(int answerIndex){
    submittedAnswers.add(answerIndex);
    setState(() {
      if (submittedAnswers.length == questions.length) {
        currentScreen = "result";
      }
    });
  }

  void playAgain() {
    setState(() {
      currentScreen = "start";
      submittedAnswers.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screen;
    if (currentScreen == "start") {
      screen = StartScreen(startQuiz);
    } else if (currentScreen == "questions") {
      screen = QuestionsScreen(onAnswerSubmit: onAnswerSubmit);
    } else {
      screen = ResultScreen(submittedAnswers, playAgain);
    }
    return MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Quiz'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 23, 81, 99),
              Color.fromARGB(255, 188, 17, 218),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: screen,
        ),
      ),
    ),
  );
  }
}