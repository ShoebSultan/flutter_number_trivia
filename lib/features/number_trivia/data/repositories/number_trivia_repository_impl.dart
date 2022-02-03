import 'package:flutter_number_trivia/core/error/exceptions.dart';
import 'package:flutter_number_trivia/core/network/network_info.dart';
import 'package:flutter_number_trivia/features/number_trivia/data/datasources/number_trivia_local_data_source.dart';
import 'package:flutter_number_trivia/features/number_trivia/data/datasources/number_trivia_remote_data_source.dart';
import 'package:flutter_number_trivia/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:flutter_number_trivia/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:flutter_number_trivia/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_number_trivia/features/number_trivia/domain/repositories/number_trivia_repository.dart';

// typedef Future<NumberTriviaModel> _ConcreteOrRandomChooser();
typedef _ConcreteOrRandomChooser = Future<NumberTriviaModel> Function();

class NumberTriviaRepositoryImpl implements NumberTriviaRepository {
  final NumberTriviaRemoteDataSource remoteDataSource;
  final NumberTriviaLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  NumberTriviaRepositoryImpl(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failures, NumberTrivia>> getConcreteNumberTrivia(
      int? number) async {
    return await _getTrivia(
        () => remoteDataSource.getConcreteNumberTrivia(number));
  }

  @override
  Future<Either<Failures, NumberTrivia>> getRandomNumberTrivia() async {
    return await _getTrivia(() => remoteDataSource.getRandomNumberTrivia());
  }

  // higher order function
  Future<Either<Failures, NumberTrivia>> _getTrivia(
      _ConcreteOrRandomChooser getConcreteOrRandom) async {
    if (await networkInfo.isConnected) {
      try {
        var remoteTrivia = await getConcreteOrRandom();
        localDataSource.cacheNumberTrivia(remoteTrivia);
        return Right(remoteTrivia);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final lastTrivia = await localDataSource.getLastNumberTrivia();
        return Right(lastTrivia);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
