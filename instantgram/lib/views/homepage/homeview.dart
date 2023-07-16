// ignore_for_file: unused_result

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
<<<<<<< HEAD:instantgram/lib/views/homepage/homeview.dart
import 'package:instantgram/state/auth/provider/auth_state_provider.dart';
import 'package:instantgram/state/img_upload/model/ftype.dart';
import 'package:instantgram/state/img_upload/service/image_picker_service.dart';
import 'package:instantgram/state/post_prefference/provider/post_pref_provider.dart';
import 'package:instantgram/views/Tabviews/my_post.dart';
import 'package:instantgram/views/Tabviews/newsfeed.dart';
import 'package:instantgram/views/Tabviews/search.dart';
import 'package:instantgram/views/components/PromptDialogs/dialog_model.dart';
import 'package:instantgram/views/components/PromptDialogs/logout_prompt.dart';
import 'package:instantgram/views/createpost/create_post_view.dart';
=======
import 'package:instantgram/state/auth/providers/auth_state_provider.dart';

import 'package:instantgram/state/image_upload/models/file_type.dart';

import 'package:instantgram/views/components/dialogs/alert_dialog_model.dart';
import 'package:instantgram/views/components/dialogs/logout_dialog.dart';
import 'package:instantgram/views/constants/strings.dart';

import '../../state/image_upload/helper/image_picker_helper.dart';
import '../../state/post_settings/post_settings_provider.dart';
import '../create_new_post_view.dart';
import '../tabs/home_view.dart';
import '../tabs/search_view.dart';
import '../tabs/user_posts_view.dart';
>>>>>>> talandron-additions-1:instantgram/lib/views/main/main_view.dart

class MainView extends ConsumerStatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainViewState();
}

class _MainViewState extends ConsumerState<MainView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
<<<<<<< HEAD:instantgram/lib/views/homepage/homeview.dart
          title: const Text('Instant-gram'),
=======
          title: const Text(
            Strings.appName,
          ),
>>>>>>> talandron-additions-1:instantgram/lib/views/main/main_view.dart
          actions: [
            IconButton(
              icon: const FaIcon(
                FontAwesomeIcons.film,
              ),
              onPressed: () async {
<<<<<<< HEAD:instantgram/lib/views/homepage/homeview.dart
=======
                // pick a video first
>>>>>>> talandron-additions-1:instantgram/lib/views/main/main_view.dart
                final videoFile =
                    await ImagePickerHelper.pickVideoFromGallery();
                if (videoFile == null) {
                  return;
                }

<<<<<<< HEAD:instantgram/lib/views/homepage/homeview.dart
                ref.refresh(postSettingProvider);

=======
                // reset the postSettingProvider
                ref.refresh(postSettingProvider);

                // go to the screen to create a new post
>>>>>>> talandron-additions-1:instantgram/lib/views/main/main_view.dart
                if (!mounted) {
                  return;
                }
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CreateNewPostView(
<<<<<<< HEAD:instantgram/lib/views/homepage/homeview.dart
                      fileType: FType.video,
=======
                      fileType: FileType.video,
>>>>>>> talandron-additions-1:instantgram/lib/views/main/main_view.dart
                      fileToPost: videoFile,
                    ),
                  ),
                );
              },
            ),
            IconButton(
              onPressed: () async {
<<<<<<< HEAD:instantgram/lib/views/homepage/homeview.dart
=======
                // pick an image first
>>>>>>> talandron-additions-1:instantgram/lib/views/main/main_view.dart
                final imageFile =
                    await ImagePickerHelper.pickImageFromGallery();
                if (imageFile == null) {
                  return;
                }

<<<<<<< HEAD:instantgram/lib/views/homepage/homeview.dart
                ref.refresh(postSettingProvider);

=======
                // reset the postSettingProvider
                ref.refresh(postSettingProvider);

                // go to the screen to create a new post
>>>>>>> talandron-additions-1:instantgram/lib/views/main/main_view.dart
                if (!mounted) {
                  return;
                }
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CreateNewPostView(
<<<<<<< HEAD:instantgram/lib/views/homepage/homeview.dart
                      fileType: FType.image,
=======
                      fileType: FileType.image,
>>>>>>> talandron-additions-1:instantgram/lib/views/main/main_view.dart
                      fileToPost: imageFile,
                    ),
                  ),
                );
              },
              icon: const Icon(
                Icons.add_photo_alternate_outlined,
              ),
            ),
            IconButton(
              onPressed: () async {
                final shouldLogOut =
<<<<<<< HEAD:instantgram/lib/views/homepage/homeview.dart
                    await const LogoutPrompt().present(context).then(
=======
                    await const LogoutDialog().present(context).then(
>>>>>>> talandron-additions-1:instantgram/lib/views/main/main_view.dart
                          (value) => value ?? false,
                        );
                if (shouldLogOut) {
                  await ref.read(authStateProvider.notifier).logOut();
                }
              },
              icon: const Icon(
                Icons.logout,
              ),
            ),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(
                  Icons.person,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.search,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.home,
                ),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            MyPostsView(),
            SearchView(),
            Newsfeed(),
          ],
        ),
      ),
    );
  }
}
