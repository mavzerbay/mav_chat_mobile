import 'package:mav_chat/view/_product/models/pagination.dart';

class PaginatedResult<T>{
  T? result;
  Pagination? pagination;

  PaginatedResult({
     this.result,
     this.pagination,
  });
}