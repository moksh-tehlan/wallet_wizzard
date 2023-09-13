import 'package:wallet_wizard/app/app.dart';
import 'package:wallet_wizard/bootstrap.dart';
import 'package:wallet_wizard/di/service_locator.dart';

Future<void> main() async {
  await setUpServiceLocator();
  await bootstrap(() => const App());
}
