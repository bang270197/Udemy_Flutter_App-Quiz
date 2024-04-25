import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  QuestionsSummary({super.key, required this.summaryData});

  List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: summaryData.map((data) {
        return Row(
          children: [
            Text(((data['question_index'] as int) + 1).toString()),
            Expanded(
              child: Column(
                children: [
                  Text(data['question'] as String),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(data['user_answer'] as String),
                  Text(data['corrent_answer'] as String)
                ],
              ),
            )
          ],
        );
      }).toList(),
    );
  }
}
