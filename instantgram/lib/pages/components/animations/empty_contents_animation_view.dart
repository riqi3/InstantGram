import 'package:instantgram/pages/components/animations/lottie_animation_view.dart';
import 'package:instantgram/pages/components/animations/models/lottie_animation.dart';

class EmptyContentsAnimationView extends LottieAnimationView {
  const EmptyContentsAnimationView({super.key})
      : super(
          animation: LottieAnimation.empty,
        );
}
