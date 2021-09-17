import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import '../../components/dialog/mav_dialog.dart';
import '../../constants/app/app_constants.dart';
import '../../constants/enums/locale_preferences_keys_enum.dart';
import '../cache/locale_manager.dart';
import 'core_dio.dart';
import 'core_dio_interface.dart';
import 'models/status_model.dart';
import 'network_manager_interface.dart';

class NetworkManager implements INetworkManager<ICoreDio> {
  ICoreDio? _coreDio;
  String _baseUrl =
      Platform.isAndroid ? ApplicationConstants.androidBaseUrl : ApplicationConstants.iosBaseUrl;

  StatusModels _statusModels =
      StatusModels(minimumValue: HttpStatus.ok, maximumValue: HttpStatus.found);
  Map<String, dynamic>? _baseHeader;
  int? _timeout;
  BuildContext? _context;
  InterceptorsWrapper? _wrapper;

  @override
  INetworkManager<ICoreDio> addBaseUrl(String baseUrl) {
    _baseUrl = baseUrl;
    return this;
  }

  @override
  INetworkManager<ICoreDio> addStatusModels(StatusModels statusModels) {
    _statusModels = statusModels;
    return this;
  }

  @override
  INetworkManager<ICoreDio> addBaseHeader(Map<String, dynamic>? value) {
    _baseHeader = value;
    return this;
  }

  @override
  INetworkManager<ICoreDio> addTimeout(int value) {
    _timeout = value;
    return this;
  }

  @override
  INetworkManager<ICoreDio> addBuildContext(BuildContext context) {
    _context = context;
    return this;
  }

  bool _isLoaderOpen = false;

  @override
  INetworkManager<ICoreDio> addLoadersOnRequest(bool withLogger) {
    _wrapper = InterceptorsWrapper(
      onRequest: (options, handler) {
        if (!handler.isCompleted) {
          _isLoaderOpen = true;
          MavDialog.showLoaderDialog(_context!);
        } else if (handler.isCompleted && _isLoaderOpen) {
          Navigator.of(_context!, rootNavigator: true).pop();
        }

        if (withLogger) {
          Logger().i(options);
        }

        handler.next(options);
      },
      onError: (e, handler) {
        if (_isLoaderOpen) Navigator.of(_context!, rootNavigator: true).pop();

        handler.next(e);
      },
    );
    return this;
  }

  @override
  ICoreDio build() {
    _coreDio = CoreDio(
      BaseOptions(
        baseUrl: _baseUrl,
        headers: _baseHeader ??
            Map.fromEntries([
              MapEntry(HttpHeaders.authorizationHeader,
                  'Bearer ${LocaleManager.instance.getStringValue(LocalePreferencesKeys.TOKEN)}'),
            ]),
        connectTimeout: _timeout,
        validateStatus: (status) {
          if (status != null) {
            if (status >= _statusModels.minimumValue && status <= _statusModels.maximumValue) {
              return true;
            }
          }
          return false;
        },
      ),
      _wrapper,
    );

    return _coreDio!;
  }
}
