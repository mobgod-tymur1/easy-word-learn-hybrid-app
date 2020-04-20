import 'package:fast_en_words/pages/check_word.dart';
import 'package:fast_en_words/processing_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_button/flutter_progress_button.dart';

import '../strings.dart';

class EnterWordsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return new Scaffold(
      appBar: new AppBar(title: Text(Strings.enter_words),),
      body:

          new EnterWordsForm(),



    );
  }
}

class EnterWordsForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new EnterWordsFormState();
  }
}

class EnterWordsFormState extends State<EnterWordsForm> {
  final _key = GlobalKey<FormState>();
  String _en_words;
  String _trans_words;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      padding: EdgeInsets.all(10.0),
      child: new Form(key: _key,
          child: Center(
            child: SingleChildScrollView(
              child: new Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  new SizedBox(height: 5.0),

                  new TextFormField(
                    validator: (value) {
                      if(value.isEmpty)
                        return Strings.enter_words;
                      _en_words=value;
                    },
                    decoration: InputDecoration(border: OutlineInputBorder(),labelText:Strings.en_words_txt),
                    maxLines: 8,

                  ),
                  new SizedBox(height: 30.0),
                  new TextFormField(
                    validator: (value) {
                      if(value.isEmpty)
                        return Strings.enter_words;
                      _trans_words=value;
                    },
                    decoration: InputDecoration(border: OutlineInputBorder(),labelText:Strings.trnas_words_txt),
                    maxLines: 8,
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ProgressButton(
                      color: Color.fromRGBO(252, 76, 76, 1.0),
                      defaultWidget:Text(Strings.start_test, style: TextStyle(color: Colors.white)),
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
                          if(_key.currentState.validate()) {
                            TextProcessing tp = new TextProcessing(
                                _en_words, _trans_words);
                            var words_list =tp.convert_to_list();
                            if(words_list!=null){
                              print('start length ${words_list.length}');
                              Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context)=>CheckWordPage(words_list)));

                            }else{
                              Scaffold.of(context).showSnackBar(SnackBar(content: Text(Strings.input_excp),backgroundColor: Colors.red));
                            }
                          }
                        };
                      },

                    ),
                  )


                ],
              ),
            ),
          )),
    );
  }
}