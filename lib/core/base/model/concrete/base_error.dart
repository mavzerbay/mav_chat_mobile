import '../abstracts/base_error_interface.dart';

class BaseError extends IErrorModel {
  final String error;
  final String? description;
  final bool? closeLoader;
  final String? navigationConstants;
  BaseError(
    this.error, {
    this.description,
    this.closeLoader,
    this.navigationConstants,
  });
}
