part of 'bored_cubit.dart';

@immutable
class BoredState extends Equatable {
  final bool loading;
  final String error;

  final BoredEntry entry;

  bool get hasError => error != null && error.isNotEmpty;
  bool get hasData => entry != null;

  BoredState({this.loading, this.error, this.entry});

  @override
  List<Object> get props => [loading, error, entry];

  BoredState update({bool loading, entry, error}) {
    return BoredState(
        loading: loading ?? this.loading,
        error: error ?? "",
        entry: entry ?? this.entry);
  }

  factory BoredState.initial() {
    return BoredState(loading: true, error: "");
  }
}
