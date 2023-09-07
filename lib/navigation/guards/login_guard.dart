import 'package:auto_route/auto_route.dart';
import 'package:wallet_wizard/navigation/routes.gr.dart';
import 'package:wallet_wizard/utils/shared_pref.dart';

/// A custom navigation guard class
/// used for controlling navigation in a routing system.
class LoginGuard extends AutoRouteGuard {
  @override
  Future<void> onNavigation(
    NavigationResolver resolver,
    StackRouter router,
  ) async {
    // Check if the user has visited the onboarding page before.
    final goToLoginPage = await Prefs.getOnBoardingVisited();

    // If the user has visited the onboarding page,
    // redirect them to the LoginRoute.
    if (goToLoginPage) {
      resolver.next();
    } else {
      // If the user hasn't visited the onboarding page,
      // redirect them to the OnBoardingRoute.
      await resolver.redirect(const OnBoardingRoute());
    }
  }
}
