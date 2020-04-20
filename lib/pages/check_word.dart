import 'package:fast_en_words/model/WordModel.dart';
import 'package:fast_en_words/pages/result.dart';
import 'package:fast_en_words/strings.dart';
import 'package:fast_en_words/test_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_button/flutter_progress_button.dart';

class CheckWordPage extends StatelessWidget{
  List<WordModel> list_words;

  CheckWordPage(List<WordModel> _list_words){
    list_words=_list_words;
    print(_list_words.length);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(title: Text(Strings.check_page_title),),
      body: new CheckWordForm(list_words),
      //new Text("test")
    );
  }
 }
class CheckWordForm extends StatefulWidget{
  WordsTest test;
  CheckWordForm(List<WordModel> list){
    print('stateful ${list.length}');
    test = new WordsTest(list);
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new CheckWordFormState(test);
  }


 }
class CheckWordFormState extends State<CheckWordForm>{
  final snack_duration = const Duration(milliseconds: 500);
  final key_ = GlobalKey<FormState>();


  WordsTest wordsTest;
  WordModel wordModel;
  var _controller = TextEditingController();
  CheckWordFormState(this.wordsTest){
    wordModel=wordsTest.next_question();
    print(wordModel.en_word);
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
        padding: EdgeInsets.all(10.0),
        child: new Form(
          child: Center(
            child: new Column(
                children: <Widget>[
                  new SizedBox(height: 30.0),

                  new Text(wordModel.trans_word,
              style: new TextStyle(color: Colors.black, fontSize: 25.0),),
                  new SizedBox(height: 30.0),

                  new TextFormField(
                    controller: _controller,
                    decoration: new InputDecoration(

                      fillColor: Colors.white,
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                        borderSide: new BorderSide(
                        ),
                      ),
                      //fillColor: Colors.green
                    ),
                    validator: (val) {
                      if(val.isEmpty) return Strings.check_page_input_excp;

                      print(val+" "+wordModel.trans_word);

                        if(wordsTest.validate_answer(val)){
                          Scaffold.of(context).showSnackBar(SnackBar(content: Text(Strings.check_page_ok),backgroundColor: Colors.green,duration: snack_duration,));
                        }else{
                          Scaffold.of(context).showSnackBar(SnackBar(content: Text(Strings.check_page_no),backgroundColor: Colors.red,duration: snack_duration));
                        }
                        _controller.clear();

                        if(wordsTest.has_next()) {
                          setState(() {
                              wordModel = wordsTest.next_question();


                          });
                        }else{
                          Navigator.of(context).pushReplacement(MaterialPageRoute(
                              builder: (context) => ResultPage(wordsTest)));
                        }


                    },
                    style: new TextStyle(
                      fontFamily: "Poppins",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),

                    child: ProgressButton(
                      color: Color.fromRGBO(29, 14, 67, 1.0),
                      defaultWidget:Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text( Strings.check_page_next, style: TextStyle(color: Colors.white)),
                          Icon(Icons.arrow_forward_ios, color: Colors.white,)
                        ],
                      ),
                      progressWidget: const CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white)),
                      width: 114,
                      height: 48,
                      borderRadius: 24,
                      animate: false,

                      onPressed: () async {
                        int score = await Future.delayed(
                            const Duration(milliseconds: 400), () => 42);
                        // After [onPressed], it will trigger animation running backwards, from end to beginning
                        return () {
                          key_.currentState.validate();

                        };
                      },

                    ),
                  ),


                ],
            ),
          ),
        key: key_,
    ));
  }
}