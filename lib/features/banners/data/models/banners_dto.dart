import 'package:json_annotation/json_annotation.dart';

part 'banners_dto.g.dart';

@JsonSerializable()
class BannersDTO {
  final List<BannerItemDTO> banners;

  BannersDTO({required this.banners});

  factory BannersDTO.fromJson(Map<String, dynamic> json) =>
      _$BannersDTOFromJson(json);

  Map<String, dynamic> toJson() => _$BannersDTOToJson(this);
}

@JsonSerializable()
class BannerItemDTO {
  final int id;
  final String image;
  final String link;

  BannerItemDTO({required this.id, required this.image, required this.link});

  factory BannerItemDTO.fromJson(Map<String, dynamic> json) =>
      _$BannerItemDTOFromJson(json);

  Map<String, dynamic> toJson() => _$BannerItemDTOToJson(this);
}
