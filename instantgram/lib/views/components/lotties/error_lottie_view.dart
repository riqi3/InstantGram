import 'package:instantgram/views/components/lotties/lottie_animation_view.dart';
import 'package:instantgram/views/components/lotties/models/lot_animations.dart';

class ErrorLottieView extends LottieAnimationView {
  const ErrorLottieView({super.key})
      : super(
          animation: LottieAnimation.error,
          reverse: true,
        );
}
