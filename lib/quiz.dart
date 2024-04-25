import 'package:flutter/material.dart';
import 'package:udemy_flutter_basic2/data/questions.dart';
import 'package:udemy_flutter_basic2/questsions_screen.dart';
import 'package:udemy_flutter_basic2/results_screen.dart';
import 'package:udemy_flutter_basic2/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  // Widget? activeScreen;

  // @override
  // void initState() {
  //   activeScreen = StartScreen(switchScreen);
  //   // TODO: implement initState
  //   super.initState();
  // }

  var activeScreen = 'start-screen';
  List<String> selecetAnswer = [];

  // nhận giá trị khi ấn vào button câu trả lời
  void chooseAnswer(String answer) {
    selecetAnswer.add(answer);
    //check khi đến câu hỏi cuối cùng
    if (selecetAnswer.length == questions.length) {
      setState(() {
        //khi trả lời hết câu hỏi -> trả lại danh sách câu trả lời = [] -> chuyển qua màn hình KQ

        activeScreen = 'results_screen';
      });
    }
  }

//khi ấn button start -> set lại giá trị
  void switchScreen() {
    setState(() {
      // activeScreen = const QuestionsScreen();
      //chuyển sang màn hình KQ
      activeScreen = 'question_screen';
    });
  }

  @override
  Widget build(context) {
    //mặc định hiểm thị lúc đầu là màn hình start
    Widget startScreen = StartScreen(switchScreen);

    //kiểm tra giá trị sau khi set -> màn hình danh sách câu hỏi
    if (activeScreen == 'question_screen') {
      //chuyển màn hình câu hỏi -> truyền vào hàm nhận câu trả lời
      startScreen = QuestionsScreen(onSelectAnswer: chooseAnswer);
    }

    //chuyển qua màn hình KQ
    if (activeScreen == 'results_screen') {
      startScreen = ResultsScreen(chosenAnswers: selecetAnswer);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.deepOrange, Colors.orangeAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
          ),
          // child: activeScreen == 'start-screen'
          //     ? StartScreen(switchScreen)
          //     : const QuestionsScreen(),
          child: startScreen,
        ),
      ),
    );
  }
}
