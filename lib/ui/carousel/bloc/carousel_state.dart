part of 'carousel_cubit.dart';

@immutable
class CarouselState extends Equatable {
  final bool loading;
  final bool init;
  final String error;
  final List<String> items;

  bool get hasError => error != null && error.isNotEmpty;
  bool get hasData => init && items.isNotEmpty;
  bool get hasNoData => init && items.isEmpty;
  int get size => items?.length ?? 0;

  CarouselState({this.loading, this.init, this.error, this.items});

  factory CarouselState.initial({bool loading}) {
    return CarouselState(
        loading: loading ?? true,
        error: "",
        init: false,
        items: <String>[]);
  }

  CarouselState update(
      {bool loading, bool init, List<String> items, error}) {
    return CarouselState(
        loading: loading ?? this.loading,
        items: items ?? this.items,
        init: init ?? this.init,
        error: error ?? "");
  }

  @override
  List<Object> get props => [loading, init, error, error];
}
