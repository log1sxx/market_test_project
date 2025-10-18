// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// File path: assets/fonts/stolzl_black.otf
  String get stolzlBlack => 'assets/fonts/stolzl_black.otf';

  /// File path: assets/fonts/stolzl_bold.otf
  String get stolzlBold => 'assets/fonts/stolzl_bold.otf';

  /// File path: assets/fonts/stolzl_medium.otf
  String get stolzlMedium => 'assets/fonts/stolzl_medium.otf';

  /// File path: assets/fonts/stolzl_regular.otf
  String get stolzlRegular => 'assets/fonts/stolzl_regular.otf';

  /// List of all assets
  List<String> get values => [
    stolzlBlack,
    stolzlBold,
    stolzlMedium,
    stolzlRegular,
  ];
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/add_to_card.svg
  SvgGenImage get addToCard =>
      const SvgGenImage('assets/icons/add_to_card.svg');

  /// File path: assets/icons/bell.svg
  SvgGenImage get bell => const SvgGenImage('assets/icons/bell.svg');

  /// File path: assets/icons/fire.svg
  SvgGenImage get fire => const SvgGenImage('assets/icons/fire.svg');

  /// File path: assets/icons/mark.svg
  SvgGenImage get mark => const SvgGenImage('assets/icons/mark.svg');

  /// Directory path: assets/icons/nav_bar_icons
  $AssetsIconsNavBarIconsGen get navBarIcons =>
      const $AssetsIconsNavBarIconsGen();

  /// File path: assets/icons/profile.svg
  SvgGenImage get profile => const SvgGenImage('assets/icons/profile.svg');

  /// List of all assets
  List<SvgGenImage> get values => [addToCard, bell, fire, mark, profile];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/cheese.png
  AssetGenImage get cheese => const AssetGenImage('assets/images/cheese.png');

  /// File path: assets/images/country_kitchen.png
  AssetGenImage get countryKitchen =>
      const AssetGenImage('assets/images/country_kitchen.png');

  /// File path: assets/images/delicacies.png
  AssetGenImage get delicacies =>
      const AssetGenImage('assets/images/delicacies.png');

  /// File path: assets/images/dinner.png
  AssetGenImage get dinner => const AssetGenImage('assets/images/dinner.png');

  /// File path: assets/images/discount_of_the_day.png
  AssetGenImage get discountOfTheDay =>
      const AssetGenImage('assets/images/discount_of_the_day.png');

  /// File path: assets/images/edit_profile_image.png
  AssetGenImage get editProfileImage =>
      const AssetGenImage('assets/images/edit_profile_image.png');

  /// File path: assets/images/fill_the_fridge.png
  AssetGenImage get fillTheFridge =>
      const AssetGenImage('assets/images/fill_the_fridge.png');

  /// File path: assets/images/fresh_vegetables.png
  AssetGenImage get freshVegetables =>
      const AssetGenImage('assets/images/fresh_vegetables.png');

  /// File path: assets/images/healthy_food.png
  AssetGenImage get healthyFood =>
      const AssetGenImage('assets/images/healthy_food.png');

  /// File path: assets/images/worlds_kitchen.png
  AssetGenImage get worldsKitchen =>
      const AssetGenImage('assets/images/worlds_kitchen.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    cheese,
    countryKitchen,
    delicacies,
    dinner,
    discountOfTheDay,
    editProfileImage,
    fillTheFridge,
    freshVegetables,
    healthyFood,
    worldsKitchen,
  ];
}

class $AssetsTranslationsGen {
  const $AssetsTranslationsGen();

  /// File path: assets/translations/intl_en.arb
  String get intlEn => 'assets/translations/intl_en.arb';

  /// File path: assets/translations/intl_ru.arb
  String get intlRu => 'assets/translations/intl_ru.arb';

  /// List of all assets
  List<String> get values => [intlEn, intlRu];
}

class $AssetsIconsNavBarIconsGen {
  const $AssetsIconsNavBarIconsGen();

  /// File path: assets/icons/nav_bar_icons/contact_nav_bar_icon.svg
  SvgGenImage get contactNavBarIcon =>
      const SvgGenImage('assets/icons/nav_bar_icons/contact_nav_bar_icon.svg');

  /// File path: assets/icons/nav_bar_icons/delivery_nav_bar_icon.svg
  SvgGenImage get deliveryNavBarIcon =>
      const SvgGenImage('assets/icons/nav_bar_icons/delivery_nav_bar_icon.svg');

  /// File path: assets/icons/nav_bar_icons/main_nav_bar_icon.svg
  SvgGenImage get mainNavBarIcon =>
      const SvgGenImage('assets/icons/nav_bar_icons/main_nav_bar_icon.svg');

  /// File path: assets/icons/nav_bar_icons/market_nav_bar_icon.svg
  SvgGenImage get marketNavBarIcon =>
      const SvgGenImage('assets/icons/nav_bar_icons/market_nav_bar_icon.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
    contactNavBarIcon,
    deliveryNavBarIcon,
    mainNavBarIcon,
    marketNavBarIcon,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsTranslationsGen translations = $AssetsTranslationsGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}

class SvgGenImage {
  const SvgGenImage(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = false;

  const SvgGenImage.vec(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    _svg.ColorMapper? colorMapper,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
        colorMapper: colorMapper,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter:
          colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
