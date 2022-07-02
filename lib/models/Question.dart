
class Question {

  String question;
 // Set<dynamic> answers;

  Question(
  {
    required this.question,
  //  required this.answers
}
      );
  @override
  String toString() {
    return '$question';
  }

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
        question: json['Frage'],
    //    answers: json[{'answer, value'}],


      //method from subcategory class



    );
  }

}
