import 'package:domain/domain.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:wallet_wizard/di/firebase_options.dart';
import 'package:wallet_wizard/navigation/routes.dart';
import 'package:wallet_wizard/utils/shared_pref.dart';

final getIt = GetIt.instance;

Future<void> setUpServiceLocator() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Prefs.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  getIt.registerSingleton<AppRouter>(AppRouter());
  initRepositories(getIt);
}
