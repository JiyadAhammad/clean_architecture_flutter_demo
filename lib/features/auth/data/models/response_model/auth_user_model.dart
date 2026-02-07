import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_user_model.freezed.dart';
part 'auth_user_model.g.dart';

@freezed
abstract class AuthUserResponseModel with _$AuthUserResponseModel {
  const factory AuthUserResponseModel({
    String? token,
    @JsonKey(name: 'user_id') int? userId,
    @JsonKey(name: 'full_name') String? fullName,
    @JsonKey(name: 'first_name') String? firstName,
    @JsonKey(name: 'last_name') String? lastName,
    String? email,
    String? mobile,
  }) = _AuthUserResponseModel;

  factory AuthUserResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AuthUserResponseModelFromJson(json);
}
