import 'package:flutter_number_trivia/features/number_trivia/domain/entities/number_trivia.dart';

class NumberTriviaModel extends NumberTrivia {
  const NumberTriviaModel({required int number, required String text})
      : super(text: text, number: number);

  factory NumberTriviaModel.fromJson(Map<String, dynamic> json) =>
      NumberTriviaModel(
        number: (json['number'] as num).toInt(),
        text: json['text'],
      );

  Map<String, dynamic> toJson() {
    return {
      "text": text,
      "number": number,
    };
  }
}
