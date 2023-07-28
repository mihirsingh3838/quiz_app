import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/summary.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget {
  void subs() {
    String submitScreen = 'submit-screen';
  }

  const ResultScreen({super.key, required this.choosenAnswer});

  final List<String> choosenAnswer;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < choosenAnswer.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': choosenAnswer[i],
      });
    }
    return summary;
  }

  @override
  Widget build(context) {
    final summaryData = getSummaryData();
    final numTotal = questions.length;
    final numCorrectAnswer = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Center(
            child: Text(
              'You answered $numCorrectAnswer out of $numTotal questions correctly!',
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(color: Colors.white, fontSize: 18),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Summary(summaryData),
          const SizedBox(
            height: 30,
          ),
          TextButton.icon(
              onPressed: subs,
              icon: const Icon(Icons.restart_alt_rounded),
              label: const Text('Submit'),)
        ]),
      ),
    );
  }
}
