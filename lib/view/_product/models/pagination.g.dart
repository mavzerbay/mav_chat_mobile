// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pagination _$PaginationFromJson(Map<String, dynamic> json) {
  return Pagination(
    currentPage: json['currentPage'] as int,
    itemsPerPage: json['itemsPerPage'] as int,
    totalItems: json['totalItems'] as int?,
    totalPages: json['totalPages'] as int?,
  );
}

Map<String, dynamic> _$PaginationToJson(Pagination instance) =>
    <String, dynamic>{
      'currentPage': instance.currentPage,
      'itemsPerPage': instance.itemsPerPage,
      'totalItems': instance.totalItems,
      'totalPages': instance.totalPages,
    };
