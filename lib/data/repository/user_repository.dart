import 'package:flutter_shopping_app/data/model/user/user_auth.dart';
import 'package:flutter_shopping_app/data/provider/user_provider.dart';
import 'package:injectable/injectable.dart';

@singleton
class UserRepository {
  final UserProvider _provider;

  const UserRepository({@Named('mock') UserProvider provider}) : _provider = provider;

  Future<UserAuth> handleLogin(String username, String password) async {
    return await _provider.login(username, password);
  }
}
