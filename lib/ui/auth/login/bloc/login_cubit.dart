import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_app/bloc/token/auth_token_cubit.dart';
import 'package:flutter_shopping_app/data/models/user/user_auth.dart';
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
      {UserRepository userRepository,
      @factoryParam AuthTokenCubit authTokenCubit})
      : _userRepository = userRepository,
        _authTokenCubit = authTokenCubit,
        super(LoginState.initial());

  void login(String userName, String password) async {
    emit(state.update(loading: true));
    try {
      MessageUtil.showLoading();
      emit(state.update(loading: true));
      UserAuth _auth = await _userRepository.handleLogin(userName, password);
      await PrefUtil.storeUserAuthData(_auth);
      _authTokenCubit.init(auth: _auth, isLoggedIn: true);
      emit(state.update(success: true, loading: false));
      MessageUtil.showSuccessMessage("Login Successful.");
    } catch (e) {
      final String _error = e.toString() ?? "Error";
      MessageUtil.showErrorMessage(_error);
      emit(state.update(error: _error, loading: false));
    }finally{
      MessageUtil.hideLoading();
    }
  }
}
