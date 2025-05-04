import 'package:get/get.dart';

import 'package:customer_onboarding_app/component/scrollableItemList.dart';
// import 'package:customer_onboarding_app/screens/splash_screen.dart';
// import 'package:customer_onboarding_app/screens/onboarding_screen.dart';
// import 'package:customer_onboarding_app/screens/login_screen.dart';
// import 'package:customer_onboarding_app/screens/register_screen.dart';
// import 'package:customer_onboarding_app/screens/home_screen.dart';
// Add other imports for profile, settings, etc., as needed

class RouteName {
  static const String initial = '/';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/home';
  static const String profile = '/profile';
  static const String settings = '/settings';
  static const String about = '/about';
  static const String contact = '/contact';
  static const String terms = '/terms';
  static const String privacy = '/privacy';
}

class Routes {
  static final List<GetPage> routes = [
    GetPage(
      name: RouteName.initial,
      page: () => ScrollableItemListPage(),
      transition: Transition.fadeIn,
    ),

    // Add others when ready
  ];
}
