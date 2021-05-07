part of 'product_item_cubit.dart';

@immutable
class ProductItemState extends Equatable {
  final bool loading;
  final bool init;
  final String error;

  final List<ProductItem> items;

  bool get hasError => error != null && error.isNotEmpty;

  bool get hasData => init && items.isNotEmpty;

  bool get hasNoData => init && items.isEmpty;

  int get size => items?.length ?? 0;

  const ProductItemState({this.loading, this.error, this.init, this.items});

  @override
  List<Object> get props => [loading, error, init, error];

  factory ProductItemState.initial({loading}) {
    return ProductItemState(
        loading: loading ?? true, error: "", init: false, items: []);
  }

  ProductItemState update({bool loading, bool init, items, error}) {
    return ProductItemState(
      loading: loading ?? this.loading,
      items: items ?? this.items,
      init: init ?? this.init,
      error: error ?? "",
    );
  }

  @override
  String toString() =>
      'ProductItemState { loading: $loading, error: $error, init: $init }';
}
