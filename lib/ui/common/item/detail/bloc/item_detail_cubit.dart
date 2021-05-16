import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_app/ui/common/item/data/model/product_item.dart';
import 'package:flutter_shopping_app/ui/common/item/data/repository/product_item_repository.dart';
import 'package:injectable/injectable.dart';

part 'item_detail_state.dart';

@injectable
class ItemDetailCubit extends Cubit<ItemDetailState> {
  final ProductItemRepository _productRepository;

  ItemDetailCubit(ProductItemRepository repository)
      : _productRepository = repository,
        super(ItemDetailState.initial());

  void loadItemDetail(int id, {ProductItem item}) async {
    try {
      if (item != null) {
        emit(state.update(loading: false, item: item));
        return;
      }

      emit(state.update(loading: true));

      ProductItem _product = await _productRepository.getProductDetail(id);

      emit(state.update(loading: false, item: _product));
    } catch (e) {
      final errorMsg = e.toString();
      emit(state.update(loading: false, error: errorMsg));
    }
  }
}
