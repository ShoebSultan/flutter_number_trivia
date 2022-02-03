import 'package:dartz/dartz.dart';
import 'package:flutter_number_trivia/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:flutter_number_trivia/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:flutter_number_trivia/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockNumberTriviaRepository extends Mock
    implements NumberTriviaRepository {}

void main() {

  late MockNumberTriviaRepository mockNumberTriviaRepository;
  late GetConcreteNumberTrivia usecase;
  
  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    usecase = GetConcreteNumberTrivia(mockNumberTriviaRepository);
  });
  // ignore: prefer_const_declarations
  final tNumber = 1;
  // ignore: prefer_const_constructors
  final tNumberTrivia =  NumberTrivia(text: "text", number: 1);
  test('should get the concrete number trivia from repository', () async {
    // Arrange
    when(mockNumberTriviaRepository.getConcreteNumberTrivia(any))
        // ignore: dead_code
        .thenAnswer((_) async => Right(tNumberTrivia));
    // Act
    // final result = await usecase.execute(number: tNumber);
    // final result = await usecase(tNumber); // using call 
    final result = await usecase(Params(number: tNumber));
    // Assert
    expect(result, Right(tNumberTrivia));
    verify(mockNumberTriviaRepository.getConcreteNumberTrivia(tNumber));
    verifyNoMoreInteractions(mockNumberTriviaRepository);
  });
}
