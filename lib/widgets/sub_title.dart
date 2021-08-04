import 'package:flutter/material.dart';

class SubTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      child: Text(
        'TODAY\'S TASKS',
        style: TextStyle(
          color: Colors.indigo[500],
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
