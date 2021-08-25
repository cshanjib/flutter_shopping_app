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

  ProductItemState({this.loading, this.init, this.error, this.items});

  factory ProductItemState.initial({loading}) {
    return ProductItemState(
        loading: loading ?? true, error: "", init: false, items: []);
  }

  ProductItemState update({bool loading, bool init, items, error}) {
    return ProductItemState(
        loading: loading ?? this.loading,
        items: items ?? this.items,
        init: init ?? this.init,
        error: error ?? "");
  }

  @override
  List<Object> get props => [loading, init, error, error];
}
