import 'package:instantgram/views/components/lotties/lottie_animation_view.dart';

import 'models/lot_animations.dart';

class LoadingLottieView extends LottieAnimationView {
  const LoadingLottieView({super.key})
      : super(
          animation: LottieAnimation.loading,
        );
}
