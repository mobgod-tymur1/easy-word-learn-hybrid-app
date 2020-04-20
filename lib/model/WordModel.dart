class WordModel{
  String _en_word;
  String _trans_word;
  String user_answer;
  bool is_correct;
  WordModel(String en_word, String trans_word){
    this._en_word=en_word;
    this._trans_word=trans_word;
  }

  String get en_word => _en_word;
  String get trans_word=>_trans_word;

  void add_user_answer(String answer){
    user_answer=answer;

  }
}