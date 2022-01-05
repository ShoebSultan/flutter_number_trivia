import 'package:flutter_number_trivia/features/number_trivia/data/models/number_trivia_model.dart';

abstract class NumberTriviaLocalDataSource {
  /// Gets the cached [numberTriviaModel] which was gotten last time 
  /// the user had an internet connection.
  /// 
  /// Throws [cacheException] if no cache data is present.
  Future<NumberTriviaModel> getLastNumberTrivia();
  Future<void> cacheNumberTrivia(NumberTriviaModel numberTriviaModel);
}
