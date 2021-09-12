import '../../../base/model/abstracts/base_error_interface.dart';

abstract class IResponseModel<T> {
  T? data;
  IErrorModel? error;
}