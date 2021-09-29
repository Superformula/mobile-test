import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_result.freezed.dart';

/// This class represents the result for the API calls
///
/// ```dart
/// Future<ApiResult<Int>> getCount() async {
///   try {
///     ...
///     return ApiResult.success(1);
///   } on Exception (e) {
///     return ApiResult.failure(e);
///   }
/// }
/// ```
@freezed
abstract class ApiResult<T> with _$ApiResult<T> {
  /// This represent a success scenario for the API call
  const factory ApiResult.success(T data) = Success<T>;

  /// This represent a failure scenario for the API call
  const factory ApiResult.failure(Exception e) = Failure<T>;
}
