import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_reports/base/base_web_api.dart';

import '../../../base/api_exception.dart';
import '../../../constants/constants.dart';
import '../../../models/WeatherDataResponse.dart';

abstract class DashboardWebApi extends BaseWebApi {
  Future<WeatherDataResponse> getCurrentWeatherData({String? location});
}

class DashboardWebApiImpl implements DashboardWebApi {
  @override
  Future<WeatherDataResponse> getCurrentWeatherData({String? location}) async {
    var response = await http
        .get(Uri.parse('$baseUrl/current.json?key=$apiKey&q=$location&aqi=no'));
    if (response.statusCode == 200) {
      return WeatherDataResponse.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 401) {
      var body = jsonDecode(response.body);
      throw AuthException(body['error']['message'] ?? "Something went wrong");
    } else {
      var body = jsonDecode(response.body);

      throw ApiException(body['error']['message'] ?? "Something went wrong");
    }
  }
}
