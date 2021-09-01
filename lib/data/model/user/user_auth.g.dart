// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_auth.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserAuth _$UserAuthFromJson(Map<String, dynamic> json) {
  return UserAuth(
    username: json['username'] as String,
    accessToken: json['accessToken'] as String,
    id: json['id'] as int,
    refreshToken: json['refreshToken'] as String,
    email: json['email'] as String,
  );
}

Map<String, dynamic> _$UserAuthToJson(UserAuth instance) => <String, dynamic>{
      'username': instance.username,
      'accessToken': instance.accessToken,
      'id': instance.id,
      'refreshToken': instance.refreshToken,
      'email': instance.email,
    };
