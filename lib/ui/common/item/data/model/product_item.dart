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
