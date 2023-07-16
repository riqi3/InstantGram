import 'package:flutter/material.dart';
import 'package:instantgram/views/components/lotties/empty_lottie_view.dart';

class EmptyContentsWithTextLottieView extends StatelessWidget {
  final String text;
  const EmptyContentsWithTextLottieView({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Colors.white54),
            ),
          ),
<<<<<<< HEAD:instantgram/lib/views/components/lotties/empty_contents_with_text_lottie_view.dart
          const EmptyLottieView(),
=======
          // const EmptyContentsAnimationView(),
>>>>>>> talandron-additions-1:instantgram/lib/views/components/animations/empty_contents_with_text_animation_view.dart
        ],
      ),
    );
  }
}
