import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:get_it/get_it.dart';

void initRepositories(GetIt locator) {
  initData(locator);
  locator.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      authFirebaseDataSource: locator(),
      dataConnectionChecker: locator(),
    ),
  );
}
