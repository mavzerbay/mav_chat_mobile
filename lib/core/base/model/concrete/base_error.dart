import '../abstracts/base_error_interface.dart';

class BaseError extends IErrorModel {
  final String error;

  BaseError(this.error);
}
