import 'package:equatable/equatable.dart';

abstract class Failures extends Equatable {
  const Failures([List properties = const <dynamic>[]]);
}

// General Failures
class ServerFailure extends Failures {
  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class CacheFailure extends Failures {
  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
