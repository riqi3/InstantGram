import 'package:instantgram/pages/components/animations/lottie_animation_view.dart';
import 'package:instantgram/pages/components/animations/models/lottie_animation.dart';

class DataNotFoundAnimationView extends LottieAnimationView {
  const DataNotFoundAnimationView({super.key})
      : super(
          animation: LottieAnimation.dataNotFound,
        );
}
