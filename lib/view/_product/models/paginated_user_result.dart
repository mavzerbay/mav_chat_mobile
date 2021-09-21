import 'package:json_annotation/json_annotation.dart';

import 'package:mav_chat/core/base/model/abstracts/base_model.dart';
import 'package:mav_chat/view/_product/models/user_dto.dart';

part 'paginated_user_result.g.dart';

@JsonSerializable()
class PaginatedUserResult extends BaseModel<PaginatedUserResult> {
  List<UserDto>? data;
  int? pageIndex;
  int? pageSize;
  int? count;
  
  PaginatedUserResult({
    this.data,
    this.pageIndex,
    this.pageSize,
    this.count,
  });

  @override
  PaginatedUserResult fromJson(Map<String, dynamic> json) {
    return _$PaginatedUserResultFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
     return _$PaginatedUserResultToJson(this);
  }
}
