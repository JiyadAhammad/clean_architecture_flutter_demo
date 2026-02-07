// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuthUserResponseModel {

 String? get token;@JsonKey(name: 'user_id') int? get userId;@JsonKey(name: 'full_name') String? get fullName;@JsonKey(name: 'first_name') String? get firstName;@JsonKey(name: 'last_name') String? get lastName; String? get email; String? get mobile;
/// Create a copy of AuthUserResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthUserResponseModelCopyWith<AuthUserResponseModel> get copyWith => _$AuthUserResponseModelCopyWithImpl<AuthUserResponseModel>(this as AuthUserResponseModel, _$identity);

  /// Serializes this AuthUserResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthUserResponseModel&&(identical(other.token, token) || other.token == token)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.email, email) || other.email == email)&&(identical(other.mobile, mobile) || other.mobile == mobile));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,token,userId,fullName,firstName,lastName,email,mobile);

@override
String toString() {
  return 'AuthUserResponseModel(token: $token, userId: $userId, fullName: $fullName, firstName: $firstName, lastName: $lastName, email: $email, mobile: $mobile)';
}


}

/// @nodoc
abstract mixin class $AuthUserResponseModelCopyWith<$Res>  {
  factory $AuthUserResponseModelCopyWith(AuthUserResponseModel value, $Res Function(AuthUserResponseModel) _then) = _$AuthUserResponseModelCopyWithImpl;
@useResult
$Res call({
 String? token,@JsonKey(name: 'user_id') int? userId,@JsonKey(name: 'full_name') String? fullName,@JsonKey(name: 'first_name') String? firstName,@JsonKey(name: 'last_name') String? lastName, String? email, String? mobile
});




}
/// @nodoc
class _$AuthUserResponseModelCopyWithImpl<$Res>
    implements $AuthUserResponseModelCopyWith<$Res> {
  _$AuthUserResponseModelCopyWithImpl(this._self, this._then);

  final AuthUserResponseModel _self;
  final $Res Function(AuthUserResponseModel) _then;

/// Create a copy of AuthUserResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? token = freezed,Object? userId = freezed,Object? fullName = freezed,Object? firstName = freezed,Object? lastName = freezed,Object? email = freezed,Object? mobile = freezed,}) {
  return _then(_self.copyWith(
token: freezed == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int?,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,mobile: freezed == mobile ? _self.mobile : mobile // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AuthUserResponseModel].
extension AuthUserResponseModelPatterns on AuthUserResponseModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthUserResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthUserResponseModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthUserResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _AuthUserResponseModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthUserResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _AuthUserResponseModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? token, @JsonKey(name: 'user_id')  int? userId, @JsonKey(name: 'full_name')  String? fullName, @JsonKey(name: 'first_name')  String? firstName, @JsonKey(name: 'last_name')  String? lastName,  String? email,  String? mobile)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthUserResponseModel() when $default != null:
return $default(_that.token,_that.userId,_that.fullName,_that.firstName,_that.lastName,_that.email,_that.mobile);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? token, @JsonKey(name: 'user_id')  int? userId, @JsonKey(name: 'full_name')  String? fullName, @JsonKey(name: 'first_name')  String? firstName, @JsonKey(name: 'last_name')  String? lastName,  String? email,  String? mobile)  $default,) {final _that = this;
switch (_that) {
case _AuthUserResponseModel():
return $default(_that.token,_that.userId,_that.fullName,_that.firstName,_that.lastName,_that.email,_that.mobile);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? token, @JsonKey(name: 'user_id')  int? userId, @JsonKey(name: 'full_name')  String? fullName, @JsonKey(name: 'first_name')  String? firstName, @JsonKey(name: 'last_name')  String? lastName,  String? email,  String? mobile)?  $default,) {final _that = this;
switch (_that) {
case _AuthUserResponseModel() when $default != null:
return $default(_that.token,_that.userId,_that.fullName,_that.firstName,_that.lastName,_that.email,_that.mobile);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AuthUserResponseModel implements AuthUserResponseModel {
  const _AuthUserResponseModel({this.token, @JsonKey(name: 'user_id') this.userId, @JsonKey(name: 'full_name') this.fullName, @JsonKey(name: 'first_name') this.firstName, @JsonKey(name: 'last_name') this.lastName, this.email, this.mobile});
  factory _AuthUserResponseModel.fromJson(Map<String, dynamic> json) => _$AuthUserResponseModelFromJson(json);

@override final  String? token;
@override@JsonKey(name: 'user_id') final  int? userId;
@override@JsonKey(name: 'full_name') final  String? fullName;
@override@JsonKey(name: 'first_name') final  String? firstName;
@override@JsonKey(name: 'last_name') final  String? lastName;
@override final  String? email;
@override final  String? mobile;

/// Create a copy of AuthUserResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthUserResponseModelCopyWith<_AuthUserResponseModel> get copyWith => __$AuthUserResponseModelCopyWithImpl<_AuthUserResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuthUserResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthUserResponseModel&&(identical(other.token, token) || other.token == token)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.email, email) || other.email == email)&&(identical(other.mobile, mobile) || other.mobile == mobile));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,token,userId,fullName,firstName,lastName,email,mobile);

@override
String toString() {
  return 'AuthUserResponseModel(token: $token, userId: $userId, fullName: $fullName, firstName: $firstName, lastName: $lastName, email: $email, mobile: $mobile)';
}


}

/// @nodoc
abstract mixin class _$AuthUserResponseModelCopyWith<$Res> implements $AuthUserResponseModelCopyWith<$Res> {
  factory _$AuthUserResponseModelCopyWith(_AuthUserResponseModel value, $Res Function(_AuthUserResponseModel) _then) = __$AuthUserResponseModelCopyWithImpl;
@override @useResult
$Res call({
 String? token,@JsonKey(name: 'user_id') int? userId,@JsonKey(name: 'full_name') String? fullName,@JsonKey(name: 'first_name') String? firstName,@JsonKey(name: 'last_name') String? lastName, String? email, String? mobile
});




}
/// @nodoc
class __$AuthUserResponseModelCopyWithImpl<$Res>
    implements _$AuthUserResponseModelCopyWith<$Res> {
  __$AuthUserResponseModelCopyWithImpl(this._self, this._then);

  final _AuthUserResponseModel _self;
  final $Res Function(_AuthUserResponseModel) _then;

/// Create a copy of AuthUserResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? token = freezed,Object? userId = freezed,Object? fullName = freezed,Object? firstName = freezed,Object? lastName = freezed,Object? email = freezed,Object? mobile = freezed,}) {
  return _then(_AuthUserResponseModel(
token: freezed == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int?,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,mobile: freezed == mobile ? _self.mobile : mobile // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
