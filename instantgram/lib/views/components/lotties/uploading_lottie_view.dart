import 'package:instantgram/views/components/lotties/lottie_animation_view.dart';

import 'models/lot_animations.dart';

class UploadingLottieView extends LottieAnimationView {
  const UploadingLottieView({super.key})
      : super(
          animation: LottieAnimation.uploading,
        );
}
