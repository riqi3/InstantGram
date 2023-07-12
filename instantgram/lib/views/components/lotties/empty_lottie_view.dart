import 'package:instantgram/views/components/lotties/lottie_animation_view.dart';

import 'models/lot_animations.dart';

class EmptyLottieView extends LottieAnimationView {
  const EmptyLottieView({super.key})
      : super(
          animation: LottieAnimation.empty,
        );
}
