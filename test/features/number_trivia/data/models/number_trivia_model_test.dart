import 'dart:convert';

import 'package:flutter_number_trivia/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:flutter_number_trivia/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixtures_readers.dart';

void main() {
  // ignore: prefer_const_declarations, prefer_const_constructors
  final tNumberTriviaModel = NumberTriviaModel(number: 1, text: "test");

  test('should be a subclass of NumberTrivia entity', () async {
    // Assert
    expect(tNumberTriviaModel, isA<NumberTrivia>());
  });

  group('from Json -', () {
    test('should return valid model when the JSON number is an integer',
        () async {
      // Arrange
      final Map<String, dynamic> jsonMap = json.decode(fixtures("trivia.json"));
      // Act
      final result = NumberTriviaModel.fromJson(jsonMap);
      // Assert
      expect(result, tNumberTriviaModel);
    });
    test('should return valid model when the JSON number is regarded as double',
        () async {
      // Arrange
      final Map<String, dynamic> jsonMap =
          json.decode(fixtures("trivia_double.json"));
      // Act
      final result = NumberTriviaModel.fromJson(jsonMap);
      // Assert
      expect(result, tNumberTriviaModel);
    });
  });

  group('to Json -', () {
    test('should return a json map containing the proper data', () async {
      // Act
      final result = tNumberTriviaModel.toJson();
      // Assert
      final expectedMap = {"text": "test", "number": 1};
      expect(result, expectedMap);
    });
  });
}
