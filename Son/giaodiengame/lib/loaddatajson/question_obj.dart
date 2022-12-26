class questionobject {
  final int? id;
  final String question;
  final String answera;
  final String answerb;
  final String answerc;
  final String answerd;
  final String correctanswer;

  questionobject({
    this.id,
    required this.question,
    required this.answera,
    required this.answerb,
    required this.answerc,
    required this.answerd,
    required this.correctanswer,
  });

  questionobject.fromJson(Map<String, dynamic> res)
      : id = res["id"],
        question = res["question"],
        answera = res["answera"],
        answerb = res["answerb"],
        answerc = res["answerc"],
        answerd = res["answerd"],
        correctanswer = res["correctanswer"];

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'answera': answera,
      'answerb': answerb,
      'answerc': answerc,
      'answerd': answerd,
      'correctanswer': correctanswer,
    };
  }
}
