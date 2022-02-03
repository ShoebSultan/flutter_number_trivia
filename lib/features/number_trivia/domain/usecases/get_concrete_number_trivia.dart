import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_number_trivia/core/error/failures.dart';
import 'package:flutter_number_trivia/core/usecases/usecase.dart';
import 'package:flutter_number_trivia/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:flutter_number_trivia/features/number_trivia/domain/repositories/number_trivia_repository.dart';

class GetConcreteNumberTrivia /* extends NumberTriviaUseCases */ implements UseCase<NumberTrivia, Params> {
  final NumberTriviaRepository repository;
  GetConcreteNumberTrivia(this.repository);

  /* Future<Either<Failures, NumberTrivia>> execute({required int number}) async {
    return await repository.getConcreteNumberTrivia(number);
  } */
  // call class 
  @override
  Future<Either<Failures, NumberTrivia>> call(Params params) async {
    return await repository.getConcreteNumberTrivia(params.number);
  }

  /* @override
  getConcreteNumberTrivia() {
    // 
    return await repository.getConcreteNumberTrivia(params.number);
  }

  @override
  getRandomNumberTrivia() {
    // 
    throw UnimplementedError();
  } */
}

class Params extends Equatable {
  final int number;

  const Params({required this.number});

  @override
  List<Object?> get props => [number];
}
