import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mood/constants/style_constants.dart';
import 'package:mood/data/repositories/auth_repository.dart';
import 'package:mood/data/repositories/profile_repository.dart';
import 'package:mood/pages/profile/cubit/profile_cubit.dart';
import 'package:mood/pages/signin/cubit/signin_cubit.dart';
import 'package:mood/pages/splash/splash_page.dart';
import 'package:mood/router.dart';
import 'package:mood/utils/auth/auth_bloc.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthRepository>(
          create: (context) => AuthRepository(
            firebaseFirestore: FirebaseFirestore.instance,
            firebaseAuth: FirebaseAuth.instance,
          ),
        ),
        RepositoryProvider<ProfileRepository>(
          create: (context) => ProfileRepository(
            firebaseFirestore: FirebaseFirestore.instance,
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(
            create: (context) => AuthBloc(
              authRepository: context.read<AuthRepository>(),
            ),
          ),
          BlocProvider<SigninCubit>(
            create: (context) => SigninCubit(
              authRepository: context.read<AuthRepository>(),
            ),
          ),
          BlocProvider<ProfileCubit>(
            create: (context) => ProfileCubit(
              profileRepository: context.read<ProfileRepository>(),
            ),
          ),
        ],
        child: MaterialApp(
          title: 'Firebase Auth',
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''),
          ],
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: MaterialColor(0xFF880E4F, themeColor),
          ),
          initialRoute: SplashPage.routeName,
          onGenerateInitialRoutes: MoodRouter.generateInitialRoutes,
          onGenerateRoute: MoodRouter.generateRoute,
          navigatorKey: GlobalKey(),
        ),
      ),
    );
  }
}
