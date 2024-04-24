import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});
  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(150, 251, 250, 250),
          ),
          const SizedBox(height: 20),
          const Text(
            'Learn flutter the fun way',
            style: TextStyle(fontSize: 23, color: Colors.white),
          ),
          const SizedBox(height: 20),
          TextButton.icon(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 23),
            ),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text(
              'Start Quiz',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            onPressed: startQuiz,
          ),
        ],
      ),
    );
  }

  // @override
  // State<StartScreen> createState() {
  //   return _StartQuiz();
  // }
}

// class _StartQuiz extends State<StartScreen> {
//   void pressed() {}

  // @override
  // Widget build(context) {
  //   return Center(
  //     child: Column(
  //       mainAxisSize: MainAxisSize.min,
  //       children: [
  //         Image.asset(
  //           'assets/images/quiz-logo.png',
  //           width: 300,
  //           color: const Color.fromARGB(150, 251, 250, 250),
  //         ),
  //         const SizedBox(height: 20),
  //         const Text(
  //           'Learn flutter the fun way',
  //           style: TextStyle(fontSize: 23, color: Colors.white),
  //         ),
  //         const SizedBox(height: 20),
  //         TextButton.icon(
  //           style: TextButton.styleFrom(
  //             textStyle: const TextStyle(fontSize: 23),
  //           ),
  //           icon: const Icon(Icons.arrow_right_alt),
  //           label: const Text(
  //             'Start Quiz',
  //             style: TextStyle(color: Colors.white, fontSize: 18),
  //           ),
  //           onPressed: () {},
  //         ),
  //       ],
  //     ),
  //   );
  // }
// }
