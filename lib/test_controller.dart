import 'dart:math';

import 'model/WordModel.dart';

class WordsTest{
  List<WordModel> _questions;
  List<WordModel> _wrong_answers;

  int index;

  WordsTest(List<WordModel> list){
    var random = new Random();

    _questions=new List();
    _wrong_answers=new List();
    while(list.isNotEmpty){
      if(list.length==1){
        _questions.add(list[0]);
        list.removeAt(0);
      }else {
        var index = random.nextInt(list.length - 1);
        _questions.add(list[index]);
        list.removeAt(index);
      }

    }
    index=0;

  }


  WordModel next_question(){
    var words = _questions[index];
    index++;
    return words;
  }

  bool has_next(){
    if(index<_questions.length)
      return true;
    return false;
  }

  bool validate_answer(String answer){

    if(answer.trim()!=_questions[index-1].en_word){

      _wrong_answers.add(_questions[index-1]);

      return false;

    }
    return true;

  }

  int num_wrong_answers()=>_wrong_answers.length;

  int num_correct_answers()=> _questions.length-_wrong_answers.length;

  double success_rate()=> num_correct_answers()*100/_questions.length;


  List<WordModel> get wrong_answers=>_wrong_answers;
  List<WordModel> get questions=>_questions;


}