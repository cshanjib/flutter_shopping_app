import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_app/ui/carousel/data/repository/carousel_repository.dart';
import 'package:injectable/injectable.dart';

part 'carousel_state.dart';

@injectable
class CarouselCubit extends Cubit<CarouselState> {
  final CarouselRepository _repository;

  CarouselCubit(CarouselRepository repo)
      : _repository = repo,
        super(CarouselState.initial());

  void loadBanners() async {
    try {
      emit(state.update(loading: true));

      final List<String> _banners = await _repository.getBannerList();
      

      emit(state.update(loading: false, items: _banners, init: true));
    } catch (e) {
      emit(state.update(loading: false, error: e.toString()));
    }
  }
}
