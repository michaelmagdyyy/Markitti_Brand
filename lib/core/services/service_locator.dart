
import 'package:get_it/get_it.dart';

import '../../views/auth/login/controller/bloc.dart';
import '../../views/scan/controller/bloc.dart';
import 'location_service.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    sl.registerLazySingleton(() => LocationService());
    sl.registerFactory(() => LoginBloc());
    sl.registerFactory(() => CodeBloc());

  }
}
