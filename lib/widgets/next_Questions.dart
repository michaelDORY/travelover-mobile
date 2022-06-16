import 'package:flutter/material.dart';
import 'package:travelover_mobile/models/nav_buttons_data.dart';
import 'package:travelover_mobile/widgets/quizQuestion.dart';
import 'package:unicons/unicons.dart';

class NextQuestion extends StatelessWidget {
  const NextQuestion({
    Key? key,
    required this.nextQuestion,
  }) : super(key: key);

  final VoidCallback nextQuestion;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: nextQuestion,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size.fromHeight(50),
          ),
          onPressed: () {},
          child: const Text("Следующий")),
    );
  }
}
