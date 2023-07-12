import 'dart:typed_data' show Uint8List;

import 'package:flutter/material.dart' as material show Image;
import 'package:instantgram/state/img_upload/extenssion/get_aspect_ratio.dart';

extension GetImageData on Uint8List {
  Future<double> getAspectRatio() {
    final image = material.Image.memory(this);
    return image.getAspectRatio();
  }
}
