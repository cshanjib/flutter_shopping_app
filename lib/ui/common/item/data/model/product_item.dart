import 'package:flutter/cupertino.dart';
import 'package:flutter_shopping_app/data/models/paginate.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_item.g.dart';

@immutable
@JsonSerializable()
class ProductItemPaged extends Paginate<ProductItem> {
  ProductItemPaged(
      {List<ProductItem> data,
      bool hasNext,
      bool hasPrev,
      int page,
      int dataCount,
      int totalPages})
      : super(
          data: data,
          hasPrev: hasPrev,
          hasNext: hasNext,
          totalPages: totalPages,
          dataCount: dataCount,
          page: page,
        );

  factory ProductItemPaged.fromJson(Map<String, dynamic> json) =>
      _$ProductItemPagedFromJson(json);

  factory ProductItemPaged.initial() => ProductItemPaged(
        data: [],
        hasNext: true,
        hasPrev: false,
        page: 0,
        totalPages: 1,
      );

  Map<String, dynamic> toJson() => _$ProductItemPagedToJson(this);

  ProductItemPaged update({
    List<ProductItem> data,
    hasNext,
    page,
    hasPrev,
    totalPages,
    dataCount
  }) {
    return ProductItemPaged(
      data: data ?? this.data,
      hasNext: hasNext ?? this.hasNext,
      page: page ?? this.page,
      totalPages: totalPages ?? this.totalPages,
      hasPrev: hasPrev ?? this.hasPrev,
      dataCount: dataCount ?? this.dataCount,
    );
  }

  @override
  String toString() {
    return '''ProductItemPaged {
      data: $data,
      hasNext: $hasNext,
      page: $page,
      totalPages: $totalPages,
      dataCount: $dataCount,
      hasPrev: $hasPrev,
    }''';
  }
}

@JsonSerializable()
class ProductItem {
  final String name;

  final String imageUrl;
  final double currency;

  final double discount;

  final String currencyType;
  final String sellingUnit;

  String get price => "$currencyType$currency";
  final double rating;
  final String description;
  final int id;
  @JsonKey(defaultValue: [])
  final List<String> benefits;

  bool get hasBenefits => benefits.isNotEmpty;

  ProductItem({
    this.name,
    this.rating,
    this.benefits,
    this.description,
    this.id,
    this.imageUrl,
    this.currency,
    this.currencyType: "\$",
    this.discount,
    this.sellingUnit,
  });

  factory ProductItem.fromJson(Map<String, dynamic> json) =>
      _$ProductItemFromJson(json);

  Map<String, dynamic> toJson() => _$ProductItemToJson(this);

  String toString() {
    return '''{
      "name": "$name",
      "imageUrl": "$imageUrl"
    }''';
  }
}
