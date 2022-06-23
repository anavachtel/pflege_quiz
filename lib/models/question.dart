
class Question {
  final String id;
  final String category;
  final String question;
  final List <Map <String, Object>> answers;

  const Question({
    required this.id,
    required this.question,
    required this.answers,
    required this.category
  });
}