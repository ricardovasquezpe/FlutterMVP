import 'package:flutterapp/mvp/utils/DatabaseHelper.dart';
import 'package:flutterapp/mvp/utils/Network.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.I;

void setupDependencies() {
  getIt.registerLazySingleton(() => Network());
  getIt.registerLazySingleton(() => DatabaseHelper());
}