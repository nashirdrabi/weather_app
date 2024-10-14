import 'package:weather_reports/base/base_repo.dart';
import 'package:weather_reports/dashboard/services/web/dashboard_web_api.dart';

import '../../models/WeatherDataResponse.dart';

class DashboardRepo extends BaseRepo<DashboardWebApi> {
  Future<WeatherDataResponse> getCurrentWeatherData({String? location}) {
    return webApi.getCurrentWeatherData(location: location);
  }
}
