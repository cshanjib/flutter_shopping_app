import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_app/constant/enum.dart';
import 'package:flutter_shopping_app/ui/item/data/model/product_item.dart';
import 'package:flutter_shopping_app/ui/item/data/repository/product_item_repository.dart';
import 'package:injectable/injectable.dart';

part 'product_item_state.dart';

@injectable
class ProductItemCubit extends Cubit<ProductItemState> {
  final ProductItemRepository _repository;

  ProductItemCubit(ProductItemRepository repo)
      : _repository = repo,
        super(ProductItemState.initial());

  void loadProducts(ITEM_TYPE type) async {
    try {
      emit(state.update(loading: true));
      
      final List<ProductItem> _products =
          await _repository.getProductList(type);

      emit(state.update(loading: false, items: _products, init: true));
    } catch (e) {
      emit(state.update(loading: false, error: e.toString()));
    }
  }
}
