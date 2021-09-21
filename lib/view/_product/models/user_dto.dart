import 'package:floor/floor.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../core/base/model/abstracts/base_model.dart';

part 'user_dto.g.dart';

@JsonSerializable()
@Entity(
  tableName: "users",
)
class UserDto extends BaseModel<UserDto> {
  @primaryKey
  String? userName;
  String? token;
  String? profilePhoto;
  String? name;
  String? surname;
  String? nameSurname;
  String? phoneNumber;
  String? lastActive;

  UserDto({
    this.userName,
    this.token,
    this.profilePhoto,
    this.name,
    this.surname,
    this.nameSurname,
    this.phoneNumber,
    this.lastActive,
  });
  
  @override
  UserDto fromJson(Map<String, dynamic> json) {
    return _$UserDtoFromJson(json);
  }

  factory UserDto.fromJson(Map<String, dynamic> json) {
    return _$UserDtoFromJson(json);
  }
  

  @override
  Map<String, dynamic> toJson() {
    return _$UserDtoToJson(this);
  }
}
