import 'dart:io' show File;

import 'package:flutter/material.dart' as material show Image;
import 'package:instantgram/state/img_upload/extenssion/get_aspect_ratio.dart';

typedef FilePath = String;

extension GetImageFileRatio on FilePath {
  Future<double> getAspectRatio() {
    final file = File(this);
    final image = material.Image.file(file);
    return image.getAspectRatio();
  }
}
