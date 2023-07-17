// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
 

// import 'package:instantgram/views/constants/strings.dart';

// import '../../state/post/provider/user_post_provider.dart';
 

// class UserPostsView extends ConsumerWidget {
//   const UserPostsView({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final posts = ref.watch(userPostsProvider);
//     return RefreshIndicator(
//       onRefresh: () {
//         ref.refresh(userPostsProvider);
//         return Future.delayed(
//           const Duration(
//             seconds: 1,
//           ),
//         );
//       },
//       child: posts.when(
//         data: (posts) {
//           if (posts.isEmpty) {
//             return const EmptyContentsWithTextAnimationView(
//               text: Strings.youHaveNoPosts,
//             );
//           } else {
//             return PostsGridView(
//               posts: posts,
//             );
//           }
//         },
//         error: (error, stackTrace) {
//           return const ErrorAnimationView();
//         },
//         loading: () {
//           return const LoadingAnimationView();
//         },
//       ),
//     );
//   }
// }
