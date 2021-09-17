import 'package:json_annotation/json_annotation.dart';
import 'package:mav_chat/core/base/model/abstracts/base_model.dart';

part 'pagination.g.dart';

@JsonSerializable()
class Pagination extends BaseModel<Pagination> {
  int currentPage;
  int itemsPerPage;
  int? totalItems;
  int? totalPages;

  Pagination({
    this.currentPage = 1,
    this.itemsPerPage = 20,
    this.totalItems,
    this.totalPages,
  });

  @override
  Pagination fromJson(Map<String, Object?> json) {
    return _$PaginationFromJson(json);
  }

  factory Pagination.fromJson(Map<String, Object> json) {
    return _$PaginationFromJson(json);
  }

  @override
  Map<String, Object?> toJson() {
    return _$PaginationToJson(this);
  }
}

Map<String, String> getPaginationHeaders(int pageNumber, int pageSize) {
  return {"pageNumber": pageNumber.toString(), "pageSize": pageSize.toString()};
}
