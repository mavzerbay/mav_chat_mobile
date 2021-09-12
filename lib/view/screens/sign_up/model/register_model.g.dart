// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterModel _$RegisterModelFromJson(Map<String, dynamic> json) {
  return RegisterModel(
    name: json['name'] as String?,
    surname: json['surname'] as String?,
    email: json['email'] as String?,
    phoneNumber: json['phoneNumber'] as String?,
    password: json['password'] as String?,
    passwordConfirm: json['passwordConfirm'] as String?,
  );
}

Map<String, dynamic> _$RegisterModelToJson(RegisterModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'surname': instance.surname,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'password': instance.password,
      'passwordConfirm': instance.passwordConfirm,
    };
