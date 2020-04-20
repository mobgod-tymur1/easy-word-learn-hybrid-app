import 'package:fast_en_words/model/WordModel.dart';

class TextProcessing{
  List<WordModel> list_words=new List();
  String _en_words;
  String _trans_words;
  TextProcessing(String en_words, String trans_words){
      _en_words = en_words;
      _trans_words=trans_words;

  }
  List<WordModel> convert_to_list(){
    var list_en_words=get_list(_en_words);
    var list_trans_words=get_list(_trans_words);

    if(list_en_words.length!=list_trans_words.length)
      return null;

    List<WordModel> out_list=new List();
    for(int i=0;i<list_en_words.length;i++){
      WordModel wordModel = new WordModel(list_en_words[i], list_trans_words[i]);
      out_list.add(wordModel);
    }
    return out_list;
  }
  List<String> get_list(String str_words){
    List<String> list= new List();
    int index_start=0;
    if(!str_words.contains('\n')){
      list.add(str_words);
      return list;
    }
    for(int i=0;i<=str_words.length;++i){

      if(i==str_words.length ) {
        String word = str_words.substring(index_start, i).trim();
        if(word!='\n' && word!=' ' && word!='') {
          //print(word);
          list.add(word);

        }
      }else if (str_words.substring(i, i + 1) == '\n') {
        String word = str_words.substring(index_start, i).trim();

        //print(word);
          list.add(word);
          index_start = i ;
        }

    }
    return list;
  }

}