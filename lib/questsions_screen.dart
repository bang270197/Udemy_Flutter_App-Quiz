import 'package:flutter/material.dart';
import 'package:udemy_flutter_basic2/answer_button.dart';
import 'package:udemy_flutter_basic2/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

//màn hình danh sách câu hỏi
class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionScreen();
  }
}

class _QuestionScreen extends State<QuestionsScreen> {
  //biến lưu thứ tự câu hỏi -> bắt đầu từ 0
  var currentQuestionIndext = 0;

  //khi ấn 1 câu trả lời bất kỳ -> truyền vào hàm onSelectAnswer nhận từ widget quiz
  void answersQuestion(String answer) {
    widget.onSelectAnswer(answer);
    setState(() {
      //tăng index -> vị trí câu hỏi tiếp theo
      currentQuestionIndext++;
    });
  }

  @override
  Widget build(context) {
    var currentQuestion = questions[currentQuestionIndext];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...currentQuestion.shuffledAnswers.map((answer) {
              return AnswerButton(
                  answerText: answer,
                  onTap: (() {
                    //khi khách hàng chọn câu trả lời
                    answersQuestion(answer);
                  }));
            })
          ],
        ),
      ),
    );
  }
}
