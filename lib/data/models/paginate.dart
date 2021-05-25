import 'package:json_annotation/json_annotation.dart';

abstract class Paginate<T> {
  static const DEFAULT_ITEM_PER_PAGE = 10;

  final List<T> data;

  @JsonKey(name: 'has_next')
  final bool hasNext;

  @JsonKey(name: 'has_prev')
  final bool hasPrev;

  final int page;

  @JsonKey(name: 'per_page')
  final int perPage;

  @JsonKey(name: 'data_count')
  final int dataCount;

  @JsonKey(name: 'total_pages')
  final int totalPages;

  Paginate(
      {this.data,
      this.hasNext,
      this.hasPrev,
      this.page,
      this.perPage,
      this.totalPages,
      this.dataCount});
}
