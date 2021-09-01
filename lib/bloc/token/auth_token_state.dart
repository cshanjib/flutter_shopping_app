part of 'auth_token_cubit.dart';

@immutable
class AuthTokenState extends Equatable {
  final UserAuth auth;
  final String error;
  final bool isLoggedIn;

  const AuthTokenState({this.auth, this.error, this.isLoggedIn});
  bool get hasError => error != null && error.isNotEmpty;
  @override
  List<Object> get props => [auth, isLoggedIn, error];

  factory AuthTokenState.initial() {
    return AuthTokenState(error: "", isLoggedIn: false);
  }

  AuthTokenState update({bool isLoggedIn, UserAuth auth, error}) {
    return AuthTokenState(
        auth: auth ?? this.auth,
        isLoggedIn: isLoggedIn ?? this.isLoggedIn,
        error: error ?? "");
  }

  @override
  String toString() => 'AuthTokenState: {auth: $auth, isLoggedIn: $isLoggedIn}';
}
