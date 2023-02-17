import 'package:superformula_test/core/resources/failure.dart';

abstract class Result<T> {
  const factory Result.failure(Failure f) = FailureResult;

  const factory Result.success(T data) = SuccessResult;

  bool get isSuccess;
  bool get isFailure;

  SuccessResult<T> get asSuccess;
  FailureResult<T> get asFailure;
}

class SuccessResult<T> implements Result<T> {
  final T data;

  const SuccessResult(this.data);

  @override
  bool get isFailure => false;

  @override
  bool get isSuccess => true;

  @override
  FailureResult<T> get asFailure =>
      throw UnimplementedError('A SuccessResult is not a failure');

  @override
  SuccessResult<T> get asSuccess => this;
}

class FailureResult<T> implements Result<T> {
  final Failure failure;

  const FailureResult(this.failure);

  @override
  bool get isFailure => true;

  @override
  bool get isSuccess => false;

  @override
  FailureResult<T> get asFailure => this;

  @override
  SuccessResult<T> get asSuccess =>
      throw UnimplementedError('A FailureResult is not a success');
}
