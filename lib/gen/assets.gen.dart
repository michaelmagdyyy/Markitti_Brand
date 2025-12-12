/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();
  /// File path: assets/images/test.png
  AssetGenImage get test => const AssetGenImage('assets/images/test.png');
  //
  // /// List of all assets
  List<AssetGenImage> get values => [test];
}

class $AssetsLottieGen {
  const $AssetsLottieGen();

  /// File path: assets/lottie/successfully.json
  String get successfully => 'assets/lottie/successfully.json';

  /// List of all assets
  List<String> get values => [successfully];
}

class $AssetsSvgGen {
  const $AssetsSvgGen();
  //
  // /// File path: assets/svg/arrow.svg
  // String get arrow => 'assets/svg/arrow.svg';

  /// File path: assets/svg/back.svg
  String get back => 'assets/svg/back.svg';
  //
  // /// File path: assets/svg/branch.svg
  // String get branch => 'assets/svg/branch.svg';
  //
  /// File path: assets/svg/camera.svg
  String get camera => 'assets/svg/camera.svg';


  /// File path: assets/svg/gallery.svg
  String get gallery => 'assets/svg/gallery.svg';
  // //
  // /// File path: assets/svg/logo.svg
  // String get logo => 'assets/svg/logo.svg';
  //fications_filled.svg';
  //
  /// File path: assets/svg/notify.svg
  String get notify => 'assets/svg/notify.svg';
  //
  // /// List of all assets
  List<String> get values => [
        back,
        camera,
        gallery,
        // logo,
        notify,
      ];
}

class $AssetsTranslationsGen {
  const $AssetsTranslationsGen();

  /// File path: assets/translations/ar.json
  String get ar => 'assets/translations/ar.json';

  /// File path: assets/translations/en.json
  String get en => 'assets/translations/en.json';

  /// List of all assets
  List<String> get values => [ar, en];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsLottieGen lottie = $AssetsLottieGen();
  static const $AssetsSvgGen svg = $AssetsSvgGen();
  static const $AssetsTranslationsGen translations = $AssetsTranslationsGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

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
    FilterQuality filterQuality = FilterQuality.low,
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

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
