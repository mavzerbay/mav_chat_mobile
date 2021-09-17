import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

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
  Future<IResponseModel<R>> send<R, T extends BaseModel>(String path,
      {required HttpTypes type,
      required T parseModel,
      dynamic data,
      Map<String, dynamic>? queryParameters,
      void Function(int, int)? onReceiveProgress}) async {
    try {
      final response = await request(
        path,
        data: data,
        options: Options(method: type.rawValue, headers: options.headers),
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
