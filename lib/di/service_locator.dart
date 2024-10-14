import 'package:get_it/get_it.dart';
import 'package:weather_reports/dashboard/repo/dashboard_repo.dart';
import 'package:weather_reports/dashboard/services/web/dashboard_web_api.dart';
import 'package:weather_reports/dashboard/viewmodel/dashboard_viewmodel.dart';

final serviceLocator = GetIt.instance;

void setupServices() {
  //dashboard
  serviceLocator
    ..registerLazySingleton<DashboardWebApi>(() => DashboardWebApiImpl())
    ..registerLazySingleton<DashboardRepo>(() => DashboardRepo())
    ..registerFactory<DashboardViewmodel>(() => DashboardViewmodel());
}
