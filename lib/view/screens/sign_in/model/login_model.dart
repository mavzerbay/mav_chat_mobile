import 'package:json_annotation/json_annotation.dart';
import 'package:mav_chat/core/base/model/abstracts/base_model.dart';

part 'login_model.g.dart';

@JsonSerializable()
class LoginModel extends BaseModel<LoginModel> {
  String? userName;
  String? password;
  
  LoginModel({
    this.userName,
    this.password,
  });

  @override
  LoginModel fromJson(Map<String, dynamic> json) {
    return _$LoginModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$LoginModelToJson(this);
  }
}
