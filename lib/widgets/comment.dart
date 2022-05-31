import 'package:flutter/material.dart';

class Comment extends StatelessWidget {
  final String imagePath;
  final String commentText;
  const Comment({
    Key? key,
    required this.imagePath,
    required this.commentText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 50.0,
          height: 50.0,
          child: ClipOval(
            child: Image.asset(
              'assets/images/profile.png',
              fit: BoxFit.contain,
            ),
          ),
        ),
        Container(
          width: 280.0,
          margin: const EdgeInsets.all(15.0),
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 1.0),
            borderRadius: const BorderRadius.all(Radius.circular(15.0) //
                ),
          ),
          child: Text(commentText,
              textAlign: TextAlign.justify,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
              )),
        ),
      ],
    );
  }
}
