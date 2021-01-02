import 'package:bloc_test/bloc_test.dart';
import 'package:qr_code_test/blocs/validation/validation.dart';
import 'package:test/test.dart';

void main() {
  ValidationBloc validationBloc;

  setUp(() {
    validationBloc = ValidationBloc();
  });

  group("ValidationBloc", () {
    test("The initial state must be 'ValidationNone'", () {
      expect(validationBloc.state, const ValidationNone());
    });

    blocTest<ValidationBloc, ValidationState>(
      "Testing when the authentication succeedes",
      build: () => validationBloc,
      act: (bloc) => bloc..add("123456789"),
      expect: const [
        ValidationSuccess("123456789"),
      ],
      verify: (bloc) {
        expect(validationBloc.state.code, equals("123456789"));
      }
    );

    blocTest<ValidationBloc, ValidationState>(
        "Testing when the authentication fails",
        build: () => validationBloc,
        act: (bloc) => bloc..add(""),
        expect: const [
          ValidationFailed(""),
        ],
        verify: (bloc) {
          expect(validationBloc.state.code, equals(""));
        }
    );
  });
}