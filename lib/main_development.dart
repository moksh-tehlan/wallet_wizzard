import 'package:flutter/cupertino.dart';
import 'package:wallet_wizard/app/app.dart';
import 'package:wallet_wizard/bootstrap.dart';
import 'package:wallet_wizard/di/service_locator.dart';
import 'package:wallet_wizard/utils/shared_pref.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Prefs.init();
  await setUpServiceLocator();
  await bootstrap(() => const App());
}
