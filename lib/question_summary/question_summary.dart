import 'package:flutter/material.dart';
import 'package:udemy_flutter_basic2/question_summary/summary_item.dart';

//Màn hình KQ
class QuestionsSummary extends StatelessWidget {
  QuestionsSummary({super.key, required this.summaryData});

  List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return SummaryItem(itemData: data);
          }).toList(),
        ),
      ),
    );
  }
}
