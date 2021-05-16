part of 'item_detail_cubit.dart';

@immutable
class ItemDetailState extends Equatable {
  final bool loading;
  final String error;

  final ProductItem item;

  bool get hasError => error != null && error.isNotEmpty;

  bool get hasData => item != null;

  const ItemDetailState({this.loading, this.error, this.item});

  @override
  List<Object> get props => [loading, error];

  factory ItemDetailState.initial({loading}) {
    return ItemDetailState(loading: loading ?? true, error: "");
  }

  ItemDetailState update({bool loading, ProductItem item, String error}) {
    return ItemDetailState(
      loading: loading ?? this.loading,
      item: item ?? this.item,
      error: error ?? "",
    );
  }

  @override
  String toString() => 'ItemDetailState { loading: $loading, error: $error }';
}
