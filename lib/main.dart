import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit_clone/common/widgets/error_text.dart';
import 'package:reddit_clone/common/widgets/loader.dart';
import 'package:reddit_clone/models/user_model.dart';
import 'package:reddit_clone/modules/auth/controller/auth_controller.dart';
import 'package:reddit_clone/router.dart';
import 'package:reddit_clone/theme/pallet.dart';
import 'package:routemaster/routemaster.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  UserModel? userModel;

  void getData(WidgetRef ref, User data) async {
    userModel = await ref
        .watch(authControllerProvider.notifier)
        .getUserData(data.uid)
        .first;
    ref.read(userProvier.notifier).update((state) => userModel);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ref.watch(authStateChangeProvider).when(
          data: (data) => MaterialApp.router(
            title: 'Reddit Clone',
            debugShowCheckedModeBanner: false,
            theme: Pallete.darkModeAppTheme,
            routerDelegate: RoutemasterDelegate(
              routesBuilder: (context) {
                if (data != null) {
                  getData(ref, data);
                  if (userModel != null) return loggedInRoute;
                }
                return loggedOutRoute;
              },
            ),
            routeInformationParser: RoutemasterParser(),
          ),
          error: (error, stackTrace) => ErrorText(error: error.toString()),
          loading: () => Loader(),
        );
  }
}
