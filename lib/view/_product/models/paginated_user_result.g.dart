// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_user_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginatedUserResult _$PaginatedUserResultFromJson(Map<String, dynamic> json) {
  return PaginatedUserResult(
    data: (json['data'] as List<dynamic>?)
        ?.map((e) => UserDto.fromJson(e as Map<String, dynamic>))
        .toList(),
    pageIndex: json['pageIndex'] as int?,
    pageSize: json['pageSize'] as int?,
    count: json['count'] as int?,
  );
}

Map<String, dynamic> _$PaginatedUserResultToJson(
        PaginatedUserResult instance) =>
    <String, dynamic>{
      'data': instance.data,
      'pageIndex': instance.pageIndex,
      'pageSize': instance.pageSize,
      'count': instance.count,
    };
