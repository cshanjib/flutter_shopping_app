part of 'product_category_cubit.dart';

@immutable
class ProductCategoryState extends Equatable {
  final bool loading;
  final bool init;
  final String error;
  final List<CategoryItem> items;

  bool get hasError => error != null && error.isNotEmpty;
  bool get hasData => init && items.isNotEmpty;
  bool get hasNoData => init && items.isEmpty;
  int get size => items?.length ?? 0;

  ProductCategoryState({this.loading, this.init, this.error, this.items});

  factory ProductCategoryState.initial({bool loading}) {
    return ProductCategoryState(
        loading: loading ?? true,
        error: "",
        init: false,
        items: <CategoryItem>[]);
  }

  ProductCategoryState update(
      {bool loading, bool init, List<CategoryItem> items, error}) {
    return ProductCategoryState(
        loading: loading ?? this.loading,
        items: items ?? this.items,
        init: init ?? this.init,
        error: error ?? "");
  }

  @override
  List<Object> get props => [loading, init, error, error];
}
