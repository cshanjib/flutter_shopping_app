import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_app/bloc/token/auth_token_cubit.dart';
import 'package:flutter_shopping_app/data/model/user/user_auth.dart';
import 'package:flutter_shopping_app/data/repository/user_repository.dart';
import 'package:flutter_shopping_app/util/message_util.dart';
import 'package:flutter_shopping_app/util/pref_util.dart';
import 'package:injectable/injectable.dart';
part 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final UserRepository _userRepository;
  final AuthTokenCubit _authTokenCubit;
  LoginCubit(
      {UserRepository repository, @factoryParam AuthTokenCubit authTokenCubit})
      : _userRepository = repository,
        _authTokenCubit = authTokenCubit,
        super(LoginState.initial());

  void login(String username, String password) async {
    try {
      emit(state.update(loading: true));
      MessageUtil.showLoading();
      final UserAuth _auth =
          await _userRepository.handleLogin(username, password);
      await PrefUtil.storeUserAuthData(_auth);
      _authTokenCubit.update(auth: _auth, isLoggedIn: true);
      MessageUtil.showSuccessMessage("Successfully logged into the system");
      emit(state.update(loading: false, success: true));
    } catch (e) {
      final String _errorMsg = e.toString() ?? "Error";
      MessageUtil.showErrorMessage(_errorMsg);
      emit(state.update(loading: false, error: _errorMsg));
    } finally {
      MessageUtil.hideLoading();
    }
  }
}
