import 'package:auto_route/auto_route.dart';
import 'package:wallet_wizard/navigation/routes.gr.dart';
import 'package:wallet_wizard/utils/shared_pref.dart';

/// A custom navigation guard class
/// used for controlling navigation in a routing system.
class HomeGuard extends AutoRouteGuard {
  @override
  Future<void> onNavigation(
    NavigationResolver resolver,
    StackRouter router,
  ) async {
    // Check if a user exists (possibly logged in).
    final showHomeScreen = await Prefs.getUserExists();

    // If a user exists, allow navigation to continue to the home screen.
    if (showHomeScreen) {
      resolver.next();
    } else {
      // If no user exists, redirect to the LoginRoute.
      await resolver.redirect(const LoginRoute());
    }
  }
}
