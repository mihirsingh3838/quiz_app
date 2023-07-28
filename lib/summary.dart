import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Summary extends StatelessWidget {
  const Summary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              return Row(
                children: [
                  CircleAvatar(
                    backgroundColor: const Color.fromARGB(255, 248, 77, 77),
                    radius: 12,
                    child: Text(
                      ((data['question_index'] as int) + 1).toString(),
                      style: GoogleFonts.roboto(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            data['question'] as String,
                            style: GoogleFonts.roboto(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            data['user_answer'] as String,
                            style: GoogleFonts.roboto(
                                color: Colors.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            data['correct_answer'] as String,
                            style: GoogleFonts.roboto(
                              color: const Color.fromARGB(255, 29, 233, 39),
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
