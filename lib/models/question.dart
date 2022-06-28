
class Question {
  final String id;
  final String category;
  final String question;
  final String subcategory;
  final List <Map <String, Object>> answers;

  const Question({
    required this.subcategory,
    required this.id,
    required this.question,
    required this.answers,
    required this.category
  });
}