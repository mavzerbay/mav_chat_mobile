// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDto _$UserDtoFromJson(Map<String, dynamic> json) {
  return UserDto(
    userName: json['userName'] as String?,
    token: json['token'] as String?,
    profilePhoto: json['profilePhoto'] as String?,
    name: json['name'] as String?,
    surname: json['surname'] as String?,
    nameSurname: json['nameSurname'] as String?,
    phoneNumber: json['phoneNumber'] as String?,
    lastActive: json['lastActive'] as String?,
  );
}

Map<String, dynamic> _$UserDtoToJson(UserDto instance) => <String, dynamic>{
      'userName': instance.userName,
      'token': instance.token,
      'profilePhoto': instance.profilePhoto,
      'name': instance.name,
      'surname': instance.surname,
      'nameSurname': instance.nameSurname,
      'phoneNumber': instance.phoneNumber,
      'lastActive': instance.lastActive,
    };
