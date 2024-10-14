import 'package:geocoding/geocoding.dart';
import 'package:location/location.dart' as device_location;
import 'package:weather_reports/base/api_exception.dart';
import 'package:weather_reports/base/base_view_model.dart';
import 'package:weather_reports/dashboard/navigator/dashboard_navigator.dart';
import 'package:weather_reports/dashboard/repo/dashboard_repo.dart';
import 'package:weather_reports/models/WeatherDataResponse.dart';

class DashboardViewmodel
    extends BaseViewModel<DashboardNavigator, DashboardRepo> {
  WeatherDataResponse? weatherDataResponse;
  String? iconUrl;
  void getCurrentWeather({String? location}) async {
    showLoading = true;
    try {
      weatherDataResponse =
          await repository.getCurrentWeatherData(location: location);
      if (weatherDataResponse?.current?.condition?.icon != null &&
          weatherDataResponse!.current!.condition!.icon!.startsWith('//')) {
        iconUrl = weatherDataResponse?.current?.condition?.icon
            ?.replaceFirst('//', 'https://');
      }
      notifyListeners();
    } on ApiException catch (e) {
      weatherDataResponse = null;
      getNavigator().showMessage(e.toString());
      notifyListeners();
    } on Exception catch (e) {
      weatherDataResponse = null;
      getNavigator().showMessage(e.toString());
      notifyListeners();
    }
    showLoading = false;
  }

  void getCurrentLocationAndWeather() async {
    device_location.Location location = device_location.Location();

    bool _serviceEnabled;
    device_location.PermissionStatus _permissionGranted;
    device_location.LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == device_location.PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != device_location.PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
    List<Placemark> placemarks = await placemarkFromCoordinates(
        _locationData?.latitude ?? 0.00, _locationData?.longitude ?? 0.00);
    print(placemarks[0].locality);
    getCurrentWeather(location: placemarks[0].locality);
  }
}
