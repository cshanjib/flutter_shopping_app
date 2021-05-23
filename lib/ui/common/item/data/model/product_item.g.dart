// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductItemPaged _$ProductItemPagedFromJson(Map<String, dynamic> json) {
  return ProductItemPaged(
    data: (json['data'] as List)
        ?.map((e) =>
            e == null ? null : ProductItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    hasNext: json['has_next'] as bool,
    hasPrev: json['has_prev'] as bool,
    page: json['page'] as int,
    dataCount: json['data_count'] as int,
    totalPages: json['total_pages'] as int,
  );
}

Map<String, dynamic> _$ProductItemPagedToJson(ProductItemPaged instance) =>
    <String, dynamic>{
      'data': instance.data,
      'has_next': instance.hasNext,
      'has_prev': instance.hasPrev,
      'page': instance.page,
      'data_count': instance.dataCount,
      'total_pages': instance.totalPages,
    };

ProductItem _$ProductItemFromJson(Map<String, dynamic> json) {
  return ProductItem(
    name: json['name'] as String,
    rating: (json['rating'] as num)?.toDouble(),
    benefits:
        (json['benefits'] as List)?.map((e) => e as String)?.toList() ?? [],
    description: json['description'] as String,
    id: json['id'] as int,
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
      'rating': instance.rating,
      'description': instance.description,
      'id': instance.id,
      'benefits': instance.benefits,
    };
