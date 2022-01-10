import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter_number_trivia/core/network/network_info.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockDataConnectionChecker extends Mock implements DataConnectionChecker {}

void main() {
  late NetworkInfoImpl networkInfo;
  late MockDataConnectionChecker mockDataConnectionChecker;
  setUp(() {
    mockDataConnectionChecker = MockDataConnectionChecker();
    networkInfo = NetworkInfoImpl(mockDataConnectionChecker);
  });

  group('isConnected -', () {
    test('should forward the call to the DataConnectionChecker.hasConnection',
        () async {
      final tHasConnection = Future.value(true);
      // Arrange
      when(mockDataConnectionChecker.hasConnection)
          .thenAnswer((_) => tHasConnection);
      // Act
      final result =  networkInfo.isConnected;
      // Assert
      verify(mockDataConnectionChecker.hasConnection);
      expect(result, tHasConnection);
    });
  });
}

 /* test('should forward the call to the DataConnectionChecker.hasConnection',
        () async {
      // Arrange
      when(mockDataConnectionChecker.hasConnection)
          .thenAnswer((_) async => true);
      // Act
      final result = await networkInfo.isConnected;
      // Assert
      verify(mockDataConnectionChecker.hasConnection);
      expect(result, true);
    }); */