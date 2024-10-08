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

  /// Directory path: assets/images/cover
  $AssetsImagesCoverGen get cover => const $AssetsImagesCoverGen();

  /// Directory path: assets/images/item
  $AssetsImagesItemGen get item => const $AssetsImagesItemGen();

  /// Directory path: assets/images/logo
  $AssetsImagesLogoGen get logo => const $AssetsImagesLogoGen();

  /// Directory path: assets/images/menu
  $AssetsImagesMenuGen get menu => const $AssetsImagesMenuGen();
}

class $AssetsSoundsGen {
  const $AssetsSoundsGen();

  /// File path: assets/sounds/sound_correct.mp3
  String get soundCorrect => 'assets/sounds/sound_correct.mp3';

  /// File path: assets/sounds/test.mp3
  String get test => 'assets/sounds/test.mp3';

  /// List of all assets
  List<String> get values => [soundCorrect, test];
}

class $AssetsImagesCoverGen {
  const $AssetsImagesCoverGen();

  /// File path: assets/images/cover/cover1.gif
  AssetGenImage get cover1 =>
      const AssetGenImage('assets/images/cover/cover1.gif');

  /// File path: assets/images/cover/cover2.gif
  AssetGenImage get cover2 =>
      const AssetGenImage('assets/images/cover/cover2.gif');

  /// File path: assets/images/cover/cover3.webp
  AssetGenImage get cover3 =>
      const AssetGenImage('assets/images/cover/cover3.webp');

  /// File path: assets/images/cover/cover4.webp
  AssetGenImage get cover4 =>
      const AssetGenImage('assets/images/cover/cover4.webp');

  /// File path: assets/images/cover/cover5.gif
  AssetGenImage get cover5 =>
      const AssetGenImage('assets/images/cover/cover5.gif');

  /// File path: assets/images/cover/cover6.gif
  AssetGenImage get cover6 =>
      const AssetGenImage('assets/images/cover/cover6.gif');

  /// File path: assets/images/cover/cover7.gif
  AssetGenImage get cover7 =>
      const AssetGenImage('assets/images/cover/cover7.gif');

  /// List of all assets
  List<AssetGenImage> get values =>
      [cover1, cover2, cover3, cover4, cover5, cover6, cover7];
}

class $AssetsImagesItemGen {
  const $AssetsImagesItemGen();

  /// File path: assets/images/item/dongvat.png
  AssetGenImage get dongvat =>
      const AssetGenImage('assets/images/item/dongvat.png');

  /// File path: assets/images/item/item_topic.jpg
  AssetGenImage get itemTopic =>
      const AssetGenImage('assets/images/item/item_topic.jpg');

  /// List of all assets
  List<AssetGenImage> get values => [dongvat, itemTopic];
}

class $AssetsImagesLogoGen {
  const $AssetsImagesLogoGen();

  /// File path: assets/images/logo/google.png
  AssetGenImage get google =>
      const AssetGenImage('assets/images/logo/google.png');

  /// File path: assets/images/logo/left.png
  AssetGenImage get left => const AssetGenImage('assets/images/logo/left.png');

  /// File path: assets/images/logo/loading.gif
  AssetGenImage get loading =>
      const AssetGenImage('assets/images/logo/loading.gif');

  /// List of all assets
  List<AssetGenImage> get values => [google, left, loading];
}

class $AssetsImagesMenuGen {
  const $AssetsImagesMenuGen();

  /// File path: assets/images/menu/learn_grammar.png
  AssetGenImage get learnGrammar =>
      const AssetGenImage('assets/images/menu/learn_grammar.png');

  /// File path: assets/images/menu/learn_listen.png
  AssetGenImage get learnListen =>
      const AssetGenImage('assets/images/menu/learn_listen.png');

  /// File path: assets/images/menu/learn_review.png
  AssetGenImage get learnReview =>
      const AssetGenImage('assets/images/menu/learn_review.png');

  /// File path: assets/images/menu/learn_sentence.png
  AssetGenImage get learnSentence =>
      const AssetGenImage('assets/images/menu/learn_sentence.png');

  /// File path: assets/images/menu/learn_speak.png
  AssetGenImage get learnSpeak =>
      const AssetGenImage('assets/images/menu/learn_speak.png');

  /// File path: assets/images/menu/learn_vocabulary.png
  AssetGenImage get learnVocabulary =>
      const AssetGenImage('assets/images/menu/learn_vocabulary.png');

  /// File path: assets/images/menu/learn_write.png
  AssetGenImage get learnWrite =>
      const AssetGenImage('assets/images/menu/learn_write.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        learnGrammar,
        learnListen,
        learnReview,
        learnSentence,
        learnSpeak,
        learnVocabulary,
        learnWrite
      ];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsSoundsGen sounds = $AssetsSoundsGen();
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
    bool gaplessPlayback = false,
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
