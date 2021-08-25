// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductItem _$ProductItemFromJson(Map<String, dynamic> json) {
  return ProductItem(
    json['name'] as String,
    json['imageUrl'] as String,
    (json['currency'] as num)?.toDouble(),
    (json['discount'] as num)?.toDouble(),
    json['currencyType'] as String,
    json['sellingUnit'] as String,
    (json['rating'] as num)?.toDouble(),
    json['description'] as String,
    json['id'] as int,
    (json['benefits'] as List)?.map((e) => e as String)?.toList() ?? [],
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
      'rating': instance.rating,
      'description': instance.description,
      'id': instance.id,
      'benefits': instance.benefits,
    };
