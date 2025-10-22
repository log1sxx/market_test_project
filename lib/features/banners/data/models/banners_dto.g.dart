// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banners_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BannersDTO _$BannersDTOFromJson(Map<String, dynamic> json) => BannersDTO(
  banners: (json['banners'] as List<dynamic>)
      .map((e) => BannerItemDTO.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$BannersDTOToJson(BannersDTO instance) =>
    <String, dynamic>{'banners': instance.banners};

BannerItemDTO _$BannerItemDTOFromJson(Map<String, dynamic> json) =>
    BannerItemDTO(
      id: (json['id'] as num).toInt(),
      image: json['image'] as String,
      link: json['link'] as String,
    );

Map<String, dynamic> _$BannerItemDTOToJson(BannerItemDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'link': instance.link,
    };
