import 'package:dartz/dartz.dart';
import 'package:flutter_number_trivia/core/error/failures.dart';
import 'package:flutter_number_trivia/features/number_trivia/domain/entities/number_trivia.dart';

abstract class NumberTriviaRepository {
  Future<Either<Failures, NumberTrivia>> getConcreteNumberTrivia(int? number);
  Future<Either<Failures, NumberTrivia>> getRandomNumberTrivia();
}
/* 
abstract class ProfileRepository {
  Future<Either<Failures, User>> setUserName(String name);
  Future<Either<Failures, User>> getUserName(String name);
  
  Future<Either<Failures, User>> uploadUserImage(String img);
} */
