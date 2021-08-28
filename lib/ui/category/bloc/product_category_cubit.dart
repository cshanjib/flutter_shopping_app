import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_app/constant/enum.dart';
import 'package:flutter_shopping_app/ui/category/data/models/category_item.dart';
import 'package:flutter_shopping_app/ui/item/data/model/product_item.dart';
import 'package:flutter_shopping_app/ui/item/data/repository/product_item_repository.dart';
import 'package:injectable/injectable.dart';

part 'product_category_state.dart';

@injectable
class ProductCategoryCubit extends Cubit<ProductCategoryState> {
  final ProductItemRepository _repository;

  ProductCategoryCubit(ProductItemRepository repo)
      : _repository = repo,
        super(ProductCategoryState.initial());

  void loadCategories() async {
    try {
      emit(state.update(loading: true));
      
      // final List<ProductItem> _products =
      //     await _repository.getProductList(type);

      // emit(state.update(loading: false, items: _products, init: true));
    } catch (e) {
      emit(state.update(loading: false, error: e.toString()));
    }
  }
}
