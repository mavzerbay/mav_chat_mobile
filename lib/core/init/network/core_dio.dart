import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:mav_chat/core/constants/enums/locale_preferences_keys_enum.dart';
import 'package:mav_chat/core/constants/navigation/navigation_constants.dart';
import 'package:mav_chat/core/init/cache/locale_manager.dart';
import 'package:mav_chat/core/utils/jwt_utils.dart';

import '../../base/model/abstracts/base_model.dart';
import '../../base/model/concrete/base_error.dart';
import '../../constants/enums/http_request_enum.dart';
import '../../extensions/network_extension.dart';
import 'core_dio_interface.dart';
import 'models/response_model.dart';
import 'models/response_model_interface.dart';

part './network_core/core_operations.dart';

class CoreDio with DioMixin implements Dio, ICoreDio {
  @override
  final BaseOptions options;

  CoreDio(this.options, InterceptorsWrapper? wrapper) {
    options = options;
    if (wrapper != null)
      interceptors.add(wrapper);
    else
      interceptors.add(InterceptorsWrapper());
    httpClientAdapter = DefaultHttpClientAdapter();
  }

  @override
  Future<IResponseModel<R>> send<R, T extends BaseModel>(
    String path, {
    required HttpTypes type,
    required T parseModel,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    void Function(int, int)? onReceiveProgress,
    bool withAuth = true,
  }) async {
    try {
      final token = LocaleManager.instance.getStringValue(LocalePreferencesKeys.TOKEN);
      if (withAuth && (token.isEmpty || token == "" || JwtUtils.isExpired(token))) {
        LocaleManager.instance.removeValue(LocalePreferencesKeys.TOKEN);
        return ResponseModel(
            error: BaseError(
          "Oturum Süreniz Doldu",
          description: "Lütfen yeniden giriş yapın",
          navigationConstants: NavigationConstants.SIGN_IN,
        ));
      }
      final response = await request(
        path,
        data: data,
        options: Options(method: type.rawValue),
        queryParameters: queryParameters,
        onReceiveProgress: onReceiveProgress,
      );
      switch (response.statusCode) {
        case HttpStatus.ok:
        case HttpStatus.accepted:
          final model = _responseParser<R, T>(parseModel, response.data);
          return ResponseModel<R>(data: model);
        default:
          return ResponseModel(error: BaseError('message'));
      }
    } on DioError catch (e) {
      return ResponseModel(error: BaseError(e.message, description: e.error));
    } catch (e) {
      return ResponseModel(error: BaseError(e.toString(), closeLoader: true));
    }
  }
}
