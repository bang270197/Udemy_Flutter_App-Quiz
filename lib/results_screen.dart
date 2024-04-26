import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:udemy_flutter_basic2/data/questions.dart';
import 'package:udemy_flutter_basic2/question_summary/question_summary.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  ResultsScreen(
      {super.key, required this.chosenAnswers, required this.resetScreen});

  void Function() resetScreen;

  //danh sách câu trả lời
  final List<String> chosenAnswers;

  //danh sách lưu thông tin kết quả và câu hỏi tương ứng

  List<Map<String, Object>> get summaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i, // thứ tự câu hỏi
        'question': questions[i].text, //câu hỏi
        'corrent_answer': questions[i].answers[0], // đáp án
        'user_answer': chosenAnswers[i] // câu trả lời
      });
    }
    return summary;
  }

  @override
  Widget build(context) {
    //Danh sách câu hỏi + KQ
    // final summaryData = getSummaryData();
    //tổng số câu hỏi
    final numTotalQuestions = questions.length;
    //lất tổng số câu trả lời đúng
    final numCorrectQuestions = summaryData.where((data) => 
       data['user_answer'] == data['corrent_answer']
    ).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numCorrectQuestions out of $numTotalQuestions question conrrectly',
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 230, 200, 253),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData: summaryData),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
              onPressed: resetScreen,
              icon: const Icon(Icons.replay_outlined),
              label: const Text("Reset Quiz"),
            )
          ],
        ),
      ),
    );
  }
}
