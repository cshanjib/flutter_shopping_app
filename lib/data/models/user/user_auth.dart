import 'package:json_annotation/json_annotation.dart';

part 'user_auth.g.dart';

@JsonSerializable()
class UserAuth {
  final String name;
  final int id;
  final String assessToken;
  final double refreshToken;
  final String email;

  UserAuth({
    this.name,
    this.assessToken,
    this.refreshToken,
    this.id,
    this.email,
  });

  factory UserAuth.fromJson(Map<String, dynamic> json) =>
      _$UserAuthFromJson(json);

  Map<String, dynamic> toJson() => _$UserAuthToJson(this);

  String toString() {
    return '''{
      "name": "$name",
    }''';
  }
}
