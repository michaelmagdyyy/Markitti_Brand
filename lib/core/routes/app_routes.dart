
import 'package:brand_app/views/home/home.dart';
import 'package:flutter/material.dart';
import '../../views/auth/login/view.dart';
import '../../views/auth/splash/splash.dart';
import '../../views/scan/scan_view.dart';
import 'routes.dart';

class AppRoutes {
  static AppRoutes get init => AppRoutes._internal();
  String initial = NamedRoutes.splash;

  AppRoutes._internal();

  Map<String, Widget Function(BuildContext)> appRoutes = {
    NamedRoutes.splash: (c) => const SplashView(),
    NamedRoutes.login: (c) => const LoginView(),
    NamedRoutes.home: (c) => const HomeView(),
    NamedRoutes.scan: (c) =>  QRScannerScreen(),

  };
}
