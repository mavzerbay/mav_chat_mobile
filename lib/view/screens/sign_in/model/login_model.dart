import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'login_model.g.dart';

@JsonSerializable()
class LoginModel extends INetworkModel {
  String? userName;
  String? password;
  
  LoginModel({
    this.userName,
    this.password,
  });

  @override
  fromJson(Map<String, dynamic> json) {
    return _$LoginModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$LoginModelToJson(this);
  }
}
