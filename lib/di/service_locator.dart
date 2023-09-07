import 'package:get_it/get_it.dart';
import 'package:wallet_wizard/navigation/routes.dart';

final getIt = GetIt.instance;

Future<void> setUpServiceLocator() async {
  getIt.registerSingleton<AppRouter>(AppRouter());
}
