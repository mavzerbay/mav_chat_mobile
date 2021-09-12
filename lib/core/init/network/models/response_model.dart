import '../../../base/model/abstracts/base_error_interface.dart';

import 'response_model_interface.dart';

class ResponseModel<T> extends IResponseModel<T> {
  @override
  final T? data;
  @override
  final IErrorModel? error;

  ResponseModel({this.data, this.error});
}
