import 'package:json_annotation/json_annotation.dart';
part 'product_item.g.dart';

@JsonSerializable()
class ProductItem {
  final String name;
  final String imageUrl;
  final double currency;
  final double discount;
  final String currencyType;
  final String sellingUnit;
  final double rating;
  final String description;
  final int id;

  @JsonKey(defaultValue: [])
  final List<String> benefits;

  String get price => "$currencyType$currency";
  bool get hasBenefits => benefits.isNotEmpty;

  ProductItem(
      this.name,
      this.imageUrl,
      this.currency,
      this.discount,
      this.currencyType,
      this.sellingUnit,
      this.rating,
      this.description,
      this.id,
      this.benefits);

  factory ProductItem.fromJson(Map<String, dynamic> json) =>
      _$ProductItemFromJson(json);

  Map<String, dynamic> toJson() => _$ProductItemToJson(this);
}
