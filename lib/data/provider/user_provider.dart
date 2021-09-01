import 'package:flutter_shopping_app/data/model/user/user_auth.dart';
import 'package:flutter_shopping_app/data/provider/dio_api_provider.dart';
import 'package:flutter_shopping_app/util/mock_util.dart';
import 'package:injectable/injectable.dart';

abstract class UserProvider {
  Future<UserAuth> login(String username, String password);
}

@Named("mock")
@Singleton(as: UserProvider)
class MockUserProvider implements UserProvider {
  @override
  Future<UserAuth> login(String username, String password) async {
    // add some delay to imitate the real api call
    await Future.delayed(Duration(seconds: 4));
    final List<Map<String, dynamic>> _allUsers = MockUtil.getUsers();
    Map<String, dynamic> _user = _allUsers.firstWhere(
        (user) =>
            user['username'] == username.trim() &&
            user['password'] == password.trim(),
        orElse: () => null);

    if (_user == null) throw Exception("Username and password doesnot match");

    return UserAuth.fromJson(_user);
  }
}

@Singleton(as: UserProvider)
class RealUserProvider extends DioApiProvider implements UserProvider {
  @override
  Future<UserAuth> login(String username, String password) {
    // TODO: implement login
    throw UnimplementedError();
  }
}
