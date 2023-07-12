import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instantgram/state/auth/provider/login_provider.dart';
import 'package:instantgram/state/provider/isloading_provider.dart';
import 'package:instantgram/views/homepage/homeview.dart';
import 'package:instantgram/views/login/loginview.dart';
import 'firebase_options.dart';
import 'dart:developer' as devtools show log;
import 'package:flutter_easyloading/flutter_easyloading.dart';

extension Log on Object {
  void log() => devtools.log(toString());
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      // options: DefaultFirebaseOptions.currentPlatform,
      );

  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.ripple
    ..loadingStyle = EasyLoadingStyle.light
    ..maskType = EasyLoadingMaskType.black
    ..userInteractions = false;

  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // calculate widget to show
    return MaterialApp(
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blueGrey,
        indicatorColor: Colors.blueGrey,
      ),
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
      ),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      builder: EasyLoading.init(),
      home: Consumer(
        builder: (context, ref, child) {
          ref.listen<bool?>(
            isLoadingProvider,
            (_, isLoading) {
              if (isLoading == true) {
                EasyLoading.show(status: 'loading...');
              } else {
                EasyLoading.dismiss();
              }
            },
          );

          final isLoggedIn = ref.watch(isLoggedInProvider);

          if (isLoggedIn) {
            return const MainView();
          } else {
            return const LoginView();
          }
        },
      ),
    );
  }
}
