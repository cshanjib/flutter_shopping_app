part of 'product_item_cubit.dart';

@immutable
class ProductItemState extends Equatable {
  final bool loading;
  final bool init;
  final String error;

  final ProductItemPaged pagedItem;

  List<ProductItem> get items => pagedItem.data;

  bool get hasError => error != null && error.isNotEmpty;

  bool get hasData => init && items.isNotEmpty;

  bool get hasNoData => init && items.isEmpty;

  int get size => items?.length ?? 0;

  const ProductItemState({this.loading, this.error, this.init, this.pagedItem});

  @override
  List<Object> get props => [loading, error, init, error, pagedItem];

  factory ProductItemState.initial({loading}) {
    return ProductItemState(
        loading: loading ?? true,
        error: "",
        init: false,
        pagedItem: ProductItemPaged.initial());
  }

  ProductItemState update(
      {bool loading, bool init, ProductItemPaged pagedItem, error}) {
    return ProductItemState(
      loading: loading ?? this.loading,
      pagedItem: pagedItem ?? this.pagedItem,
      init: init ?? this.init,
      error: error ?? "",
    );
  }

  @override
  String toString() =>
      'ProductItemState { loading: $loading, error: $error, init: $init }';
}
