// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_auth.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserAuth _$UserAuthFromJson(Map<String, dynamic> json) {
  return UserAuth(
    username: json['username'] as String,
    assessToken: json['assessToken'] as String,
    refreshToken: (json['refreshToken'] as num)?.toDouble(),
    id: json['id'] as int,
    email: json['email'] as String,
  );
}

Map<String, dynamic> _$UserAuthToJson(UserAuth instance) => <String, dynamic>{
      'username': instance.username,
      'id': instance.id,
      'assessToken': instance.assessToken,
      'refreshToken': instance.refreshToken,
      'email': instance.email,
    };
