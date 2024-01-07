import 'package:flutter/material.dart';
import 'package:quiz_app/QuestionSumary/summary_item.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary({super.key, required this.summary});

  final List<Map<String, Object>> summary;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summary.map((data) {
            return SummaryItem(data);
          }).toList(),
        ),
      ),
    );
  }
}
