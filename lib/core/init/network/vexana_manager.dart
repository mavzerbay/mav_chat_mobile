import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vexana/vexana.dart';

import '../../components/dialog/custom_loader_dialog.dart';

class VexanaManager {
  static VexanaManager? _instace;
  static BuildContext? _context;
  static VexanaManager instance(BuildContext? context) {
    _context = context;
    if (_instace != null) return _instace!;
    _instace = VexanaManager._init();
    return _instace!;
  }

  static const String _iosBaseUrl = 'https://localhost:5001'; //localhost:5001
  static const String _androidBaseUrl = 'https://10.0.2.2:5001'; //10.0.2.2:5001

  VexanaManager._init();

  INetworkManager networkManager = NetworkManager(
    isEnableLogger: true,
    options: BaseOptions(baseUrl: Platform.isAndroid ? _androidBaseUrl : _iosBaseUrl),
    interceptor: InterceptorsWrapper(
      onRequest: (options, handler) {
        if (!handler.isCompleted) {
          showDialog(
            context: _context!,
            barrierDismissible: false,
            builder: (context) {
              return CustomLoaderDialog();
            },
          );
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
