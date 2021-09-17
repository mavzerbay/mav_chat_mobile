import '../abstracts/base_error_interface.dart';

class BaseError extends IErrorModel {
  final String error;
  final String? description;
  final bool? closeLoader;

  BaseError(this.error, {this.description,this.closeLoader});
}
