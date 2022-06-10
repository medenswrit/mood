import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mood/pages/base/base_page.dart';
import 'package:mood/pages/base/tabs/analysis/analysis_page.dart';
import 'package:mood/pages/base/tabs/daily/daily_page.dart';
import 'package:mood/pages/base/tabs/home/home_page.dart';
import 'package:mood/pages/profile/profile_page.dart';
import 'package:mood/pages/signin/signin_page.dart';
import 'package:mood/pages/splash/splash_page.dart';

class MoodRouter {
  static List<Route<dynamic>> generateInitialRoutes(String route) {
    return [generateRoute(RouteSettings(name: route))];
  }

  static List<Route<dynamic>> generateInitialRoutesState(
      NavigatorState state, String route) {
    return generateInitialRoutes(route);
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

//  Passing an argument in a route
    // final profileRepository = args as ProfileRepository;
    // return MaterialPageRoute(
    //   builder: (_) => BlocProvider(
    //     create: (context) =>
    //         ProfileCubit(profileRepository: profileRepository),
    //     child: const ProfilePage(),
    //   ),
    // );

    switch (settings.name) {
      case BasePage.routeName:
        return MaterialPageRoute(builder: (context) => const BasePage());
      case SigninPage.routeName:
        return MaterialPageRoute(builder: (context) => const SigninPage());
      case SplashPage.routeName:
        return MaterialPageRoute(builder: (context) => const SplashPage());
      case ProfilePage.routeName:
        return MaterialPageRoute(builder: (context) => const ProfilePage());
      //  Tabs
      case HomePage.routeName:
        return MaterialPageRoute(builder: (context) => const HomePage());
      case AnalysisPage.routeName:
        return MaterialPageRoute(builder: (context) => const AnalysisPage());
      case DailyPage.routeName:
        return MaterialPageRoute(builder: (context) => const DailyPage());
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
