// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HistoriesDTO _$HistoriesDTOFromJson(Map<String, dynamic> json) => HistoriesDTO(
  histories: (json['story'] as List<dynamic>)
      .map((e) => History.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$HistoriesDTOToJson(HistoriesDTO instance) =>
    <String, dynamic>{'story': instance.histories};

History _$HistoryFromJson(Map<String, dynamic> json) => History(
  id: (json['id'] as num).toInt(),
  previewImage: json['preview_image'] as String,
  viewed: json['viewed'] as bool,
  isBookmark: json['is_bookmark'] as bool,
  position: json['position'] as String,
  title: json['title'] as String,
  slides: (json['slides'] as List<dynamic>)
      .map((e) => Slide.fromJson(e as Map<String, dynamic>))
      .toList(),
  lastPage: (json['last_page'] as List<dynamic>)
      .map((e) => LastPage.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$HistoryToJson(History instance) => <String, dynamic>{
  'id': instance.id,
  'preview_image': instance.previewImage,
  'viewed': instance.viewed,
  'is_bookmark': instance.isBookmark,
  'position': instance.position,
  'title': instance.title,
  'slides': instance.slides.map((e) => e.toJson()).toList(),
  'last_page': instance.lastPage.map((e) => e.toJson()).toList(),
};

Slide _$SlideFromJson(Map<String, dynamic> json) => Slide(
  id: (json['id'] as num).toInt(),
  image: json['image'] as String,
  preTitle: json['pre_title'] as String,
  title: json['title'] as String,
  text: json['text'] as String,
  buttonLink: json['button_link'] as String,
  textPosition: json['text_position'] as String,
  isButton: json['is_button'] as bool,
);

Map<String, dynamic> _$SlideToJson(Slide instance) => <String, dynamic>{
  'id': instance.id,
  'image': instance.image,
  'pre_title': instance.preTitle,
  'title': instance.title,
  'text': instance.text,
  'button_link': instance.buttonLink,
  'text_position': instance.textPosition,
  'is_button': instance.isButton,
};

LastPage _$LastPageFromJson(Map<String, dynamic> json) => LastPage(
  title: json['title'] as String,
  desc: json['desc'] as String,
  videoLink: json['video_link'] as String,
  previewImage: json['preview_image'] as String,
  goods: (json['goods'] as List<dynamic>)
      .map((e) => Good.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$LastPageToJson(LastPage instance) => <String, dynamic>{
  'title': instance.title,
  'desc': instance.desc,
  'video_link': instance.videoLink,
  'preview_image': instance.previewImage,
  'goods': instance.goods,
};

Good _$GoodFromJson(Map<String, dynamic> json) => Good(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  image: json['image'] as String,
  price: (json['price'] as num).toInt(),
  salePrice: (json['sale_price'] as num?)?.toInt(),
  unit: (json['unit'] as num).toInt(),
  unitText: json['unit_text'] as String,
  isHit: json['is_hit'] as bool,
  isSeason: json['is_season'] as bool,
);

Map<String, dynamic> _$GoodToJson(Good instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'image': instance.image,
  'price': instance.price,
  'sale_price': instance.salePrice,
  'unit': instance.unit,
  'unit_text': instance.unitText,
  'is_hit': instance.isHit,
  'is_season': instance.isSeason,
};
