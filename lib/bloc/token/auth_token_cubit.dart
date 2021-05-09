import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_app/data/models/user/user_auth.dart';
import 'package:flutter_shopping_app/util/pref_util.dart';
import 'package:injectable/injectable.dart';

part 'auth_token_state.dart';

@injectable
class AuthTokenCubit extends Cubit<AuthTokenState> {
  AuthTokenCubit() : super(AuthTokenState.initial());

  void init({UserAuth auth, bool isLoggedIn}) async {
    try {
      emit(state.update(
          auth: auth ?? PrefUtil.getUserAuthData(),
          isLoggedIn: isLoggedIn ?? PrefUtil.isUserLoggedIn()));
    } catch (e) {
      final errorMsg = e.toString();
      emit(state.update(error: errorMsg));
    }
  }
}
