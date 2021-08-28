import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_app/ui/category/data/models/category_item.dart';
import 'package:flutter_shopping_app/ui/category/data/repository/product_category_repository.dart';
import 'package:injectable/injectable.dart';

part 'product_category_state.dart';

@injectable
class ProductCategoryCubit extends Cubit<ProductCategoryState> {
  final ProductCategoryRepository _repository;

  ProductCategoryCubit(ProductCategoryRepository repo)
      : _repository = repo,
        super(ProductCategoryState.initial());

  void loadCategories() async {
    try {
      emit(state.update(loading: true));

      final List<CategoryItem> _categories = await _repository.getCategoryList();

      emit(state.update(loading: false, items: _categories, init: true));
    } catch (e) {
      emit(state.update(loading: false, error: e.toString()));
    }
  }
}
