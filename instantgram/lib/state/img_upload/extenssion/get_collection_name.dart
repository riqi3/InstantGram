import 'package:instantgram/state/img_upload/model/ftype.dart';

extension CollectionName on FType {
  String get collectionName {
    switch (this) {
      case FType.image:
        return 'images';
      case FType.video:
        return 'videos';
    }
  }
}
