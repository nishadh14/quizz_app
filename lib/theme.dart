import 'package:flutter/material.dart';

const appBarColor = Color.fromARGB(255, 238, 86, 255);
const accentColor = Color.fromARGB(255, 246, 116, 255);
const backgroundColor = Color.fromARGB(255, 255, 203, 241);

AppBar quizAppBar() => AppBar(
      title: const Text("Quiz App",
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.w700, color: Colors.white)),
      centerTitle: true,
      backgroundColor: appBarColor,
    );
