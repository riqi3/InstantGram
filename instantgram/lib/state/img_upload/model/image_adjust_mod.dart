import 'package:flutter/foundation.dart' show immutable;
import 'package:flutter/material.dart' show Image;

@immutable
class ImageMod {
  final Image image;
  final double ratio;

  const ImageMod({
    required this.image,
    required this.ratio,
  });
}