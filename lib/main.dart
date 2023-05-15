import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/screens/homepage.dart';
import 'classes/my_theme.dart';
import 'firebase_options.dart';
import 'screens/loading.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(ProviderScope(child: MyApp()));
}

final firebaseinitializeProvider = FutureProvider<FirebaseApp>((ref) async {
  return await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform);
});

class MyApp extends ConsumerWidget {
  MyApp({Key? key}) : super(key: key);
  // final Future<FirebaseApp> _initFirebaseSdk = Firebase.initializeApp();
  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //  We will watch this provider to see if the firebase has been initialized
    //  As said this gives async value so it can gives 3 types of results
    //  1. The result is a Future<FirebaseApp>
    //  2. The result is a Future<Error>
    //  3. It's still loading
    final initialize = ref.watch(firebaseinitializeProvider);

    return MaterialApp(
        navigatorKey: _navigatorKey,
        themeMode: ThemeMode.dark,
        darkTheme: MyTheme.darkTheme,
        debugShowCheckedModeBanner: false,
        //  We will use the initialize to check if the firebase has been initialized
        //  .when function can only be used with AsysncValue. If you hover over intialize
        //  you can see what type of variable it is. I have left it dynamic here for your better understanding
        //  Though it's always recommended to not to use dynamic variables.

        // Now here if the Firebase is initialized we will be redirected to AuthChecker
        // which checks if the user is logged in or not.

        //  the other Two functions speaks for themselves.

        home: initialize.when(
          data: (data) {
            return const Homepage();
          },
          error: (e, stackTrace) => Center(
            child: Text(e.toString()),
          ),
          loading: () => const Loading(),
        ));
  }
}
