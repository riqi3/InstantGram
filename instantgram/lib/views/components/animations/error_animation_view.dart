import 'package:instantgram/views/components/animations/lottie_animation.dart';
import 'package:instantgram/views/components/animations/models/lottie_animation.dart';

class ErrorAnimationView extends LottieAnimationView {
  const ErrorAnimationView({super.key})
      : super(
          animation: LottieAnimation.error,
        );
}