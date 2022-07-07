
import 'package:meals_app/models/Question.dart';

class Answers {

  String ?answer;
  bool ?value;

  Answers({
    required this.answer,
    required this.value
  });



/*   Answers.fromJson(Map json) {
     answer = json['answer'];
     value = json['value'];
   }*/

  /*  Map<String, dynamic> toJson() {
     final Map<String, dynamic> data = new Map<String, dynamic>();
     data['answer'] = this.answer;
    data['value'] = this.value;
     return data;
   }
   Map<dynamic, dynamic> toMap() {
     return {
       'answer': answer,
       'value': value,
     };
   }
   */
  @override
  String toString() {

    return '$answer '
        '$value';
  }
  factory Answers.fromJson(Map<String, dynamic> json) {
    print('this');
    print(json['antwort'] as String);
    print(json['value'] as bool);
    return Answers(
        answer: json['antwort'] as String,
        value: json['value'] as bool);

  }
  // String toJson() => json.encode(toMap());

  getAnswers(json) {
    answer = json['antwort'] as String;
    value = json['value'] as bool;

  //answer.forEach((k, v) => print("Key : $k, Value : $v"));
}
  static List <Answers> fromJsonArray(jsonArray) {
    List <Answers> answersFromJson = [];
    print('list created');
    jsonArray.forEach((jsonData) {
      answersFromJson.add(Answers.fromJson(jsonData));
    });
    print('answersFromJson');
    print(answersFromJson);
    return answersFromJson;



  }

}