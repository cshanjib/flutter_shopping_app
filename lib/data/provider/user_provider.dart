import 'package:flutter_shopping_app/data/models/user/user_auth.dart';
import 'package:flutter_shopping_app/util/mock_util.dart';
import 'package:injectable/injectable.dart';

abstract class UserProvider {
  Future<UserAuth> login(String username, String password);
}

@Named("mock")
@Singleton(as: UserProvider)
class MockUserProvider implements UserProvider {
  const MockUserProvider();

  @override
  Future<UserAuth> login(String username, String password) async {
    //add some delay to give the feel of api call
    await Future.delayed(Duration(seconds: 3));
    final List<Map<String, dynamic>> _data = MockUtil.getUsers();
    Map<String, dynamic> _user = _data.firstWhere(
        (Map data) =>
            data["username"]?.toString()?.trim() == username &&
            data["password"]?.toString()?.trim() == password,
        orElse: () => null);
    if (_user == null) throw Exception("Username and password does not match");

    return Future.value(UserAuth.fromJson(_user));
  }
}
