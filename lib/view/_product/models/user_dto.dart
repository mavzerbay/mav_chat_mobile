import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'user_dto.g.dart';

@JsonSerializable()
class UserDto extends INetworkModel {
  String? userName;
  String? token;
  String? profilePhoto;
  String? name;
  String? surname;
  String? nameSurname;
  String? phoneNumber;

  UserDto({
    this.userName,
    this.token,
    this.profilePhoto,
    this.name,
    this.surname,
    this.nameSurname,
    this.phoneNumber,
  });
  @override
  fromJson(Map<String, dynamic> json) {
    return _$UserDtoFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$UserDtoToJson(this);
  }
}
