import 'package:json_annotation/json_annotation.dart';
part 'history_dto.g.dart';

@JsonSerializable()
class HistoriesDTO {
  @JsonKey(name: 'story')
  final List<History> histories;

  HistoriesDTO({required this.histories});

  factory HistoriesDTO.fromJson(Map<String, dynamic> json) =>
      _$HistoriesDTOFromJson(json);

  Map<String, dynamic> toJson() => _$HistoriesDTOToJson(this);
}

@JsonSerializable(explicitToJson: true)
class History {
  final int id;
  @JsonKey(name: 'preview_image')
  final String previewImage;
  final bool viewed;
  @JsonKey(name: 'is_bookmark')
  final bool isBookmark;
  final String position;
  final String title;
  final List<Slide> slides;
  @JsonKey(name: 'last_page')
  final List<LastPage> lastPage;

  History({
    required this.id,
    required this.previewImage,
    required this.viewed,
    required this.isBookmark,
    required this.position,
    required this.title,
    required this.slides,
    required this.lastPage,
  });

  factory History.fromJson(Map<String, dynamic> json) =>
      _$HistoryFromJson(json);
  Map<String, dynamic> toJson() => _$HistoryToJson(this);
}

@JsonSerializable()
class Slide {
  final int id;
  final String image;
  @JsonKey(name: 'pre_title')
  final String preTitle;
  final String title;
  final String text;
  @JsonKey(name: 'button_link')
  final String buttonLink;
  @JsonKey(name: 'text_position')
  final String textPosition;
  @JsonKey(name: 'is_button')
  final bool isButton;

  Slide({
    required this.id,
    required this.image,
    required this.preTitle,
    required this.title,
    required this.text,
    required this.buttonLink,
    required this.textPosition,
    required this.isButton,
  });

  factory Slide.fromJson(Map<String, dynamic> json) => _$SlideFromJson(json);
  Map<String, dynamic> toJson() => _$SlideToJson(this);
}

@JsonSerializable()
class LastPage {
  final String title;
  final String desc;
  @JsonKey(name: 'video_link')
  final String videoLink;
  @JsonKey(name: 'preview_image')
  final String previewImage;
  final List<Good> goods;

  LastPage({
    required this.title,
    required this.desc,
    required this.videoLink,
    required this.previewImage,
    required this.goods,
  });

  factory LastPage.fromJson(Map<String, dynamic> json) =>
      _$LastPageFromJson(json);
  Map<String, dynamic> toJson() => _$LastPageToJson(this);
}

@JsonSerializable()
class Good {
  final int id;
  final String title;
  final String image;
  final int price;
  @JsonKey(name: 'sale_price')
  final int? salePrice;
  final int unit;
  @JsonKey(name: 'unit_text')
  final String unitText;
  @JsonKey(name: 'is_hit')
  final bool isHit;
  @JsonKey(name: 'is_season')
  final bool isSeason;

  Good({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
    this.salePrice,
    required this.unit,
    required this.unitText,
    required this.isHit,
    required this.isSeason,
  });

  factory Good.fromJson(Map<String, dynamic> json) => _$GoodFromJson(json);
  Map<String, dynamic> toJson() => _$GoodToJson(this);
}
