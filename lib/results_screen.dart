import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:udemy_flutter_basic2/data/questions.dart';
import 'package:udemy_flutter_basic2/question_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.chosenAnswers});

  //danh sách câu trả lời
  final List<String> chosenAnswers;

  //danh sách lưu thông tin kết quả và câu hỏi tương ứng

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i, // thứ tụ câu hỏi
        'question': questions[i].text, //câu hỏi
        'corrent_answer': questions[i].answers[0], // đáp án
        'user_answer': chosenAnswers[i] // câu trả lời
      });
    }
    return summary;
  }

  @override
  Widget build(context) {
    // TODO: implement build
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['corrent_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                "You answered $numCorrectQuestions out of $numTotalQuestions question conrrectly"),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData: getSummaryData()),
            const SizedBox(
              height: 30,
            ),
            TextButton(onPressed: () {}, child: Text("Reset Quiz"))
          ],
        ),
      ),
    );
  }
}
