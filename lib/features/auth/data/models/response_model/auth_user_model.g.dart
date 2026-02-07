// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthUserResponseModel _$AuthUserResponseModelFromJson(
  Map<String, dynamic> json,
) => _AuthUserResponseModel(
  token: json['token'] as String?,
  userId: (json['user_id'] as num?)?.toInt(),
  fullName: json['full_name'] as String?,
  firstName: json['first_name'] as String?,
  lastName: json['last_name'] as String?,
  email: json['email'] as String?,
  mobile: json['mobile'] as String?,
);

Map<String, dynamic> _$AuthUserResponseModelToJson(
  _AuthUserResponseModel instance,
) => <String, dynamic>{
  'token': instance.token,
  'user_id': instance.userId,
  'full_name': instance.fullName,
  'first_name': instance.firstName,
  'last_name': instance.lastName,
  'email': instance.email,
  'mobile': instance.mobile,
};
