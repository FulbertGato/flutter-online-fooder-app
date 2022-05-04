import 'package:flutter/material.dart';
import '../models/burger.dart';
import '../models/menu.dart';
import '../screens/auth/login_screen.dart';
import '../screens/home/detail_menu_screen.dart';
import '../screens/home/detail_screen.dart';
import '../screens/initial/on_boarding.dart';
import '../screens/initial/splash_screens.dart';
import '../screens/order/checkout_screen.dart';
import '../screens/order/pay_screen.dart';
import '../screens/order/success_order_screen.dart';
import '../screens/tab_screen.dart';

class RouteGenerator {
  static const String onboarding = '/onboarding_screen';
  static const String splash = '/';
  static const String login = '/login_screen';
  static const String details = '/details_screen';
  static const String detailsMenu = '/details_menu_screen';
  static const String main = '/tab_screen';
  static const String registered = '/registered_screen';
  static const String checkout = '/checkout_screen';
  static const String successOrder = '/success_order_screen';
  static const String pay = '/pay_screen';
  RouteGenerator._();


  static Route<dynamic> generateRoute(RouteSettings settings) {

    switch (settings.name) {
      case splash:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
        case onboarding:
        return MaterialPageRoute(
        builder: (_) => OnboardingScreen(),

        );

        case login:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );

        case main:
        return MaterialPageRoute(
          builder: (_) => const TabScreen(),
        );

        case details:
        return MaterialPageRoute(

          builder: (_) => DetailScreen(
            burger: settings.arguments as Burger,
          ),

        );
        case detailsMenu:
        return MaterialPageRoute(

          builder: (_) =>  DetailMenuScreen(
            menu: settings.arguments as Menu,
          ),

        );

        case checkout:
        return MaterialPageRoute(
          builder: (_) => const Checkoutscreen(),
        );
        case pay:
        return MaterialPageRoute(
          builder: (_) => const PayScreen(),
        );

        case successOrder:
        return MaterialPageRoute(
          builder: (_) => const SuccessOrderScreen(),
        );
      default:
        throw const RouteException('Route not found');
    }

  }

}
class RouteException implements Exception {
  final String message;

  const RouteException(this.message);
}