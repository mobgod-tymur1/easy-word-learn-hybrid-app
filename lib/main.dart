import 'package:fast_en_words/pages/check_word.dart';
import 'package:flutter/material.dart';

import 'pages/enter_words.dart';


void main() {
  runApp(new MaterialApp(

    debugShowCheckedModeBanner: false,
    home: new EnterWordsPage(),
    theme: new ThemeData(
        fontFamily: 'Roboto',
        primaryColor:   Color.fromRGBO(120, 66, 205, 1.0),
    ),

  ));
}
