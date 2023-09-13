import 'package:data/src/data_source/firebase/auth_firebase_datasource.dart';
import 'package:get_it/get_it.dart';

void initDataSource(GetIt locator) {
  locator.registerLazySingleton<AuthFirebaseDataSource>(
    () => AuthFirebaseDataSource(firebaseAuth: locator()),
  );
}
