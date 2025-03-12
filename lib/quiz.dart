import 'package:flutter/material.dart';
import 'package:flutter_quiz/Data/Qustions.dart';
import 'package:flutter_quiz/qestions_screen.dart';
import 'package:flutter_quiz/start_screen.dart';
import 'package:flutter_quiz/Data/Qustions.dart';
import 'package:flutter_quiz/result_screen.dart';

class quiz extends StatefulWidget{
  const quiz({super.key});

  @override
  State<quiz> createState() {
    return _quizState();
  }
}
class _quizState extends State<quiz>{
  List<String> selectedAnswer = [];
  var activeScreen = "start-screen";

  void SwitchScreen () {
    setState(() {
      activeScreen = "question-screen";
    });
  }

  void _chooseAnswer(String answer){
    selectedAnswer.add(answer);

    if(selectedAnswer.length == qestions.length){
      setState(() {
        activeScreen = "results-screen";
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswer = [];
      activeScreen = 'questions-screen';
    });
  }
  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(SwitchScreen);

    if(activeScreen == "question-screen"){
      screenWidget = QuestionsScreen(onSelectAnswer: _chooseAnswer,);
    }

    if(activeScreen == "results-screen"){
      screenWidget = ResultsScreen(chosenAnswers: selectedAnswer,
      onRestart: restartQuiz,);
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container
          (
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
       child: screenWidget,
        ),
      ),
    );
  }
}