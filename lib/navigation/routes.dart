import 'package:auto_route/auto_route.dart';
import 'package:wallet_wizard/navigation/guards/home_guard.dart';
import 'package:wallet_wizard/navigation/guards/login_guard.dart';

import 'package:wallet_wizard/navigation/routes.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: OnBoardingRoute.page, initial: true),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: OtpRoute.page),
        AutoRoute(page: HomeRoute.page),
      ];
}
