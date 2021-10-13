// ignore_for_file: avoid_void_async

import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:mobile_test/base/result_state.dart';
import 'package:qr_api/qr_api.dart';
import 'package:qr_models/qr_models.dart';

class QrDetailCubit extends Cubit<ResultState<QRSeed>> {
  QrDetailCubit(this._repository) : super(const Initial());

  final SeedRepository _repository;

  void getQrSeed() async {
    emit(const ResultState.loading());
    final result = await _repository.fetchSeed();
    result.when(
      success: (data) => emit(ResultState.data(data)),
      failure: (e) => emit(ResultState.error(_getErrorMessage(e))),
    );
  }

  String _getErrorMessage(Exception e) {
    /// Here you can define multiple type of [Exception] and return a custom
    /// message for each one.
    if (e is SocketException) {
      return 'Internet error';
    }
    if (e is HttpException) {
      return 'Server error';
    } else {
      return 'Unknown error';
    }
  }

  @visibleForTesting
  String getErrorMessage(Exception e) => _getErrorMessage(e);
}
