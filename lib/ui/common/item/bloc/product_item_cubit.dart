import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_app/constant/enum.dart';
import 'package:flutter_shopping_app/ui/common/item/data/model/product_item.dart';
import 'package:flutter_shopping_app/ui/common/item/data/repository/product_item_repository.dart';
import 'package:injectable/injectable.dart';

part 'product_item_state.dart';

@injectable
class ProductItemCubit extends Cubit<ProductItemState> {
  final ProductItemRepository _productRepository;

  ProductItemCubit(ProductItemRepository repository,
      {@factoryParam ProductItem product})
      : _productRepository = repository,
        super(ProductItemState.initial());

  void loadProducts({ITEM_TYPE type}) async {
    try {
      emit(state.update(loading: true));

      List<ProductItem> products =
          await _productRepository.getProductList(type: type);

      emit(state.update(loading: false, items: products, init: true));
    } catch (e) {
      final errorMsg = e.toString();
      emit(state.update(loading: false, error: errorMsg));
    }
  }
}
