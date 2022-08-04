
class Answers {
  //properties
  String? answer;
  bool? value;

  Answers({required this.answer, required this.value});

  @override
  //converter
  String toString() {
    return '$answer '
        '$value';
  }

  //factory to get Answers from Firebase
  factory Answers.fromJson(Map<String, dynamic> json) {
    return Answers(
        answer: json['answer'] as String, value: json['value'] as bool);
  }

  //put answers into a list
  static List<Answers> fromJsonArray(List<dynamic> jsonArray) {
    List<Answers> answersFromJson = [];
    for (var jsonData in jsonArray) {
      answersFromJson.add(Answers.fromJson(jsonData));
    }

    return answersFromJson;
  }
}
