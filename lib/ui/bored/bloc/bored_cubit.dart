import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_app/ui/bored/data/model/bored_entry.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_shopping_app/ui/bored/data/repository/bored_repository.dart';
import 'package:injectable/injectable.dart';
part 'bored_state.dart';

@injectable
class BoredCubit extends Cubit<BoredState> {
  final BoredRepository _repository;
  BoredCubit(BoredRepository repository)
      : _repository = repository,
        super(BoredState.initial());

  void loadBoredItem() async {
    try {
      emit(state.update(loading: true));
      final BoredEntry _entry = await _repository.handleGetBoredEntry();
      emit(state.update(loading: false, entry: _entry));
    } catch (e) {
      emit(state.update(loading: false, error: e.message));
      //todo notify user

    }
  }
}
