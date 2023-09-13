import 'package:data/src/di/data_source.dart';
import 'package:data/src/di/external_dependencies.dart';
import 'package:get_it/get_it.dart';

void initData(GetIt locator){
  initExternalDependencies(locator);
  initDataSource(locator);
}
