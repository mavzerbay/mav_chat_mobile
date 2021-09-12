import '../../base/model/abstracts/base_model.dart';
import '../../constants/enums/http_request_enum.dart';
import 'models/response_model_interface.dart';

abstract class ICoreDio {
  Future<IResponseModel<R>> send<R, T extends BaseModel>(String path,
      {required HttpTypes type,
      required T parseModel,
      dynamic data,
      Map<String, Object>? queryParameters,
      void Function(int, int)? onReceiveProgress});
}
