// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Product _$$_ProductFromJson(Map<String, dynamic> json) => _$_Product(
      key: json['key'] as String?,
      variations: (json['variations'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>?)
          .toList(),
      product_id: json['product_id'] as String?,
      name: json['name'] as String?,
      category_name: json['category_name'] as String?,
    );

Map<String, dynamic> _$$_ProductToJson(_$_Product instance) =>
    <String, dynamic>{
      'key': instance.key,
      'variations': instance.variations,
      'product_id': instance.product_id,
      'name': instance.name,
      'category_name': instance.category_name,
    };
