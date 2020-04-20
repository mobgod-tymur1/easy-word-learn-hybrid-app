import 'package:fast_en_words/pages/check_word.dart';
import 'package:fast_en_words/pages/enter_words.dart';
import 'package:fast_en_words/test_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_button/flutter_progress_button.dart';

import '../strings.dart';

class ResultPage extends StatelessWidget{

  WordsTest _test;

  ResultPage(WordsTest test){
    _test=test;

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar:  new AppBar(title: Text('Result')),
      body: new Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center ,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Text(
                '${Strings.result_page_you_cool} ${_test.success_rate().round().toString()}%\n'
                '${Strings.result_page_num_of_mistakes} ${_test.num_wrong_answers()} \n'
                '${Strings.result_page_num_of_correct_ans} ${_test.num_correct_answers()}',
              style: new TextStyle(color: Colors.black,fontFamily: 'Roboto', fontSize: 20.0),

            ),
            SizedBox(height: 25,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ProgressButton(
                color: Color.fromRGBO(29, 14, 67, 1.0),
                defaultWidget:Text(Strings.result_page_restart, style: TextStyle(color: Colors.white)),
                progressWidget: const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white)),
                width: 114,
                height: 48,
                borderRadius: 24,
                animate: false,

                onPressed: () async {
                  int score = await Future.delayed(
                      const Duration(milliseconds: 1000), () => 42);
                  // After [onPressed], it will trigger animation running backwards, from end to beginning
                  return () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(

                          builder: (context) => CheckWordPage(_test.questions)));

                  };
                },

              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ProgressButton(
                color: Color.fromRGBO(252, 76, 76, 1.0),
                defaultWidget:Column(
                  mainAxisAlignment: MainAxisAlignment.center ,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(Strings.result_page_run_mistakes, style: TextStyle(color: Colors.white)),

                  ],
                ),
                progressWidget: const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white)),
                width: 114,
                height: 50,
                borderRadius: 24,
                animate: false,

                onPressed: () async {
                  int score = await Future.delayed(
                      const Duration(milliseconds: 1000), () => 42);
                  // After [onPressed], it will trigger animation running backwards, from end to beginning
                  return () {

                    if(_test.wrong_answers.isNotEmpty) {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(

                          builder: (context) => CheckWordPage(_test.wrong_answers)));
                    }
                  };
                },

              ),
            ),

          ],
        ),

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).pushReplacement(MaterialPageRoute(

              builder: (context) => EnterWordsPage()));
        },
        child: Icon(Icons.home),
        backgroundColor:                 Color.fromRGBO(252, 76, 76, 1.0),


      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

    );
  }

}