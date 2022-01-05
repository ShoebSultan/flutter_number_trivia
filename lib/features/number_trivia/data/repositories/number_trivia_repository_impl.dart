import 'package:flutter_number_trivia/core/platform/network_info.dart';
import 'package:flutter_number_trivia/features/number_trivia/data/datasources/number_trivia_local_data_source.dart';
import 'package:flutter_number_trivia/features/number_trivia/data/datasources/number_trivia_remote_data_source.dart';
import 'package:flutter_number_trivia/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:flutter_number_trivia/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_number_trivia/features/number_trivia/domain/repositories/number_trivia_repositry.dart';

class NumberTriviaRepositoryImpl implements NumberTriviaRepository {
  final NumberTriviaRemoteDataSource remoteDataSource;
  final NumberTriviaLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  NumberTriviaRepositoryImpl(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.networkInfo});
  @override
  Future<Either<Failures, NumberTrivia>> getConcreteNumberTrivia(int? number) {
    // ignore: null_argument_to_non_null_type
    return Future.value();
  }

  @override
  Future<Either<Failures, NumberTrivia>> getRandomNumberTrivia() {
    // ignore: null_argument_to_non_null_type
    return Future.value();
  }
}
