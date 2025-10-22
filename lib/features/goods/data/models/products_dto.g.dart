// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductsDTO _$ProductsDTOFromJson(Map<String, dynamic> json) => ProductsDTO(
  products: (json['products'] as List<dynamic>)
      .map((e) => ProductItemDTO.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ProductsDTOToJson(ProductsDTO instance) =>
    <String, dynamic>{'products': instance.products};

ProductItemDTO _$ProductItemDTOFromJson(Map<String, dynamic> json) =>
    ProductItemDTO(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      image: json['image'] as String,
      price: (json['price'] as num).toInt(),
      sale_price: (json['sale_price'] as num?)?.toInt(),
      unit: (json['unit'] as num).toInt(),
      unit_text: json['unit_text'] as String,
    );

Map<String, dynamic> _$ProductItemDTOToJson(ProductItemDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'image': instance.image,
      'price': instance.price,
      'sale_price': instance.sale_price,
      'unit': instance.unit,
      'unit_text': instance.unit_text,
    };
