// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qrcode_api_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _QrCodeApiService implements QrCodeApiService {
  _QrCodeApiService(this._dio, {this.baseUrl});

  final Dio _dio;

  String? baseUrl;

  @override
  Future<QrSeedDataModel> getSeed(seed) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'value': seed};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<QrSeedDataModel>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/seed',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = QrSeedDataModel.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
