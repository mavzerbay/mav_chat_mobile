import 'package:json_annotation/json_annotation.dart';
import 'package:mav_chat/core/base/model/abstracts/base_model.dart';

part 'register_model.g.dart';

@JsonSerializable()
class RegisterModel extends BaseModel<RegisterModel> {
  String? name;
  String? surname;
  String? email;
  String? phoneNumber;
  String? password;
  String? passwordConfirm;

  RegisterModel({
    this.name,
    this.surname,
    this.email,
    this.phoneNumber,
    this.password,
    this.passwordConfirm,
  });

  @override
 RegisterModel fromJson(Map<String, dynamic> json) {
    return _$RegisterModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$RegisterModelToJson(this);
  }
}
