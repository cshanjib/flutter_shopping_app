part of 'login_cubit.dart';

@immutable
class LoginState extends Equatable {
  final bool loading;

  final String error;
  final bool success;

  bool get hasError => error.isNotEmpty;

  LoginState({this.loading, this.error, this.success});

  factory LoginState.initial() => LoginState(
        loading: false,
        success: false,
        error: "",
      );

  LoginState update({bool loading, bool success, String error}) {
    return LoginState(
      loading: loading ?? this.loading,
      success: success ?? this.success,
      error: error ?? "",
    );
  }

  @override
  List<Object> get props => [loading, hasError, success];
}
