import 'package:dartz/dartz.dart';
import 'package:flutter_number_trivia/core/error/failures.dart';
import 'package:flutter_number_trivia/core/usecases/usecase.dart';
import 'package:flutter_number_trivia/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:flutter_number_trivia/features/number_trivia/domain/repositories/number_trivia_repository.dart';

class GetRandomNumberTrivia implements UseCase<NumberTrivia, NoParams> {
  final NumberTriviaRepository repository;

  GetRandomNumberTrivia(this.repository);
  @override
  Future<Either<Failures, NumberTrivia>> call(NoParams params) async {
    // ignore: null_argument_to_non_null_type
    // throw Future<Either<Failures, NumberTrivia>>.value();
    return await repository.getRandomNumberTrivia();
  }
}

