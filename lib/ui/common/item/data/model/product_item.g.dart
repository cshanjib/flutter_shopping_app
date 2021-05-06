// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductItem _$ProductItemFromJson(Map<String, dynamic> json) {
  return ProductItem(
    name: json['name'] as String,
    imageUrl: json['imageUrl'] as String,
    currency: (json['currency'] as num)?.toDouble(),
    currencyType: json['currencyType'] as String,
    discount: (json['discount'] as num)?.toDouble(),
    sellingUnit: json['sellingUnit'] as String,
  );
}

Map<String, dynamic> _$ProductItemToJson(ProductItem instance) =>
    <String, dynamic>{
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'currency': instance.currency,
      'discount': instance.discount,
      'currencyType': instance.currencyType,
      'sellingUnit': instance.sellingUnit,
    };
