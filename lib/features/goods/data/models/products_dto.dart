import 'package:json_annotation/json_annotation.dart';

part 'products_dto.g.dart';

@JsonSerializable()
class ProductsDTO {
  final List<ProductItemDTO> products;

  ProductsDTO({required this.products});

  factory ProductsDTO.fromJson(Map<String, dynamic> json) =>
      _$ProductsDTOFromJson(json);
  Map<String, dynamic> toJson() => _$ProductsDTOToJson(this);
}

@JsonSerializable()
class ProductItemDTO {
  final int id;
  final String title;
  final String image;
  final int price;
  final int? sale_price;
  final int unit;
  final String unit_text;

  ProductItemDTO({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
    this.sale_price,
    required this.unit,
    required this.unit_text,
  });

  factory ProductItemDTO.fromJson(Map<String, dynamic> json) =>
      _$ProductItemDTOFromJson(json);
  Map<String, dynamic> toJson() => _$ProductItemDTOToJson(this);
}
