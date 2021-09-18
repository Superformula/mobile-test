import 'package:freezed_annotation/freezed_annotation.dart';
part 'either.freezed.dart';

@freezed
@immutable
abstract class Either<L, R> with _$Either<L, R> {
  const Either._();
  const factory Either.left(L left) = Left<L, R>;
  const factory Either.right(R right) = Right<L, R>;

  Either<L, R> flatMap(Either<L, R> Function(R rightValue) validatorFunction) {
    return when(
        left: (left) => Either.left(left),
        right: (right) => validatorFunction(right));
  }

  Either<L, R2> andThen<R2>(Either<L, R2> next) =>
      when(left: (left) => Either.left(left), right: (_) => next);
}

A id<A>(A a) => a;
