import 'package:json_annotation/json_annotation.dart';
part 'user_auth.g.dart';

@JsonSerializable()
class UserAuth {
  final String username;
  final String accessToken;
  final int id;
  final String refreshToken;
  final String email;

  UserAuth(
      {this.username,
      this.accessToken,
      this.id,
      this.refreshToken,
      this.email});

  factory UserAuth.fromJson(Map<String, dynamic> json) =>
      _$UserAuthFromJson(json);

  Map<String, dynamic> toJson() => _$UserAuthToJson(this);

  @override
  String toString() {
    return '''{
          "username": "$username"
      }''';
  }
}
