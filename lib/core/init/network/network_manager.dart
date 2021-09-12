import 'package:dio/dio.dart';

import '../../constants/enums/locale_preferences_keys_enum.dart';
import '../cache/locale_manager.dart';
import 'core_dio.dart';
import 'core_dio_interface.dart';

class NetworkManager {
  static NetworkManager? _instance;

  static NetworkManager? get instance {
    _instance ??= NetworkManager._init();
    return _instance;
  }

  ICoreDio? coreDio;

  NetworkManager._init() {
    final baseOptions = BaseOptions(
      // baseUrl: "https://jsonplaceholder.typicode.com/",
      baseUrl: "https://reqres.in/api",
      headers: {"val": LocaleManager.instance.getStringValue(LocalePreferencesKeys.TOKEN)},
    );

    coreDio = CoreDio(baseOptions);
  }
}
