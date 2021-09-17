import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vexana/vexana.dart';

import '../../components/dialog/mav_dialog.dart';
import '../../constants/app/app_constants.dart';

class VexanaManager {
  static VexanaManager? _instace;
  static BuildContext? _context;
  static VexanaManager instance(BuildContext? context) {
    _context = context;
    if (_instace != null) return _instace!;
    _instace = VexanaManager._init();
    return _instace!;
  }

  VexanaManager._init();

  INetworkManager networkManager = NetworkManager(
    isEnableLogger: true,
    options: BaseOptions(
      baseUrl: Platform.isAndroid
          ? ApplicationConstants.androidBaseUrl
          : ApplicationConstants.iosBaseUrl,
    ),
    interceptor: InterceptorsWrapper(
      onRequest: (options, handler) {
        if (!handler.isCompleted) {
          MavDialog.showLoaderDialog(_context!);
        } else {
          Navigator.of(_context!, rootNavigator: true).pop();
        }

        handler.next(options);
      },
      onError: (e, handler) {
        Navigator.of(_context!, rootNavigator: true).pop();

        handler.next(e);
      },
    ),
  );
}
