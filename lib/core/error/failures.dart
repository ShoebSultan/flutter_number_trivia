import 'package:equatable/equatable.dart';

abstract class Failures extends Equatable {
  const Failures([List properties = const <dynamic>[]]);
  @override
  // ignore: todo
  // TODO: implement props
  List<Object?> get props => [];
}

// General Failures
class ServerFailure extends Failures {}

class CacheFailure extends Failures {}
