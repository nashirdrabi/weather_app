// {
// "location": {
// "name": "London",
// "region": "City of London, Greater London",
// "country": "United Kingdom",
// "lat": 51.5171,
// "lon": -0.1062,
// "tz_id": "Europe/London",
// "localtime_epoch": 1728669894,
// "localtime": "2024-10-11 19:04"
// },
// "current": {
// "last_updated_epoch": 1728669600,
// "last_updated": "2024-10-11 19:00",
// "temp_c": 10.2,
// "temp_f": 50.4,
// "is_day": 0,
// "condition": {
// "text": "Partly cloudy",
// "icon": "//cdn.weatherapi.com/weather/64x64/night/116.png",
// "code": 1003
// },
// "wind_mph": 2.7,
// "wind_kph": 4.3,
// "wind_degree": 177,
// "wind_dir": "S",
// "pressure_mb": 1016.0,
// "pressure_in": 30.0,
// "precip_mm": 0.0,
// "precip_in": 0.0,
// "humidity": 71,
// "cloud": 50,
// "feelslike_c": 10.2,
// "feelslike_f": 50.4,
// "windchill_c": 10.2,
// "windchill_f": 50.3,
// "heatindex_c": 10.2,
// "heatindex_f": 50.3,
// "dewpodynamic_c": 2.2,
// "dewpodynamic_f": 35.9,
// "vis_km": 10.0,
// "vis_miles": 6.0,
// "uv": 0.0,
// "gust_mph": 4.3,
// "gust_kph": 7.0
// }
// }

import 'dart:convert';

WeatherDataResponse weatherDataResponseFromJson(String str) =>
    WeatherDataResponse.fromJson(json.decode(str));

String weatherDataResponseToJson(WeatherDataResponse data) =>
    json.encode(data.toJson());

class WeatherDataResponse {
  CurrentLocationData? location;
  Current? current;

  WeatherDataResponse({
    this.location,
    this.current,
  });

  factory WeatherDataResponse.fromJson(Map<String, dynamic> json) =>
      WeatherDataResponse(
        location: json["location"] == null
            ? null
            : CurrentLocationData.fromJson(json["location"]),
        current:
            json["current"] == null ? null : Current.fromJson(json["current"]),
      );

  Map<String, dynamic> toJson() => {
        "location": location?.toJson(),
        "current": current?.toJson(),
      };
}

class Current {
  dynamic lastUpdatedEpoch;
  String? lastUpdated;
  dynamic tempC;
  dynamic tempF;
  dynamic isDay;
  Condition? condition;
  dynamic windMph;
  dynamic windKph;
  dynamic windDegree;
  String? windDir;
  dynamic pressureMb;
  dynamic pressureIn;
  dynamic precipMm;
  dynamic precipIn;
  dynamic humidity;
  dynamic cloud;
  dynamic feelslikeC;
  dynamic feelslikeF;
  dynamic windchillC;
  dynamic windchillF;
  dynamic heatindexC;
  dynamic heatindexF;
  dynamic dewpodynamicC;
  dynamic dewpodynamicF;
  dynamic visKm;
  dynamic visMiles;
  dynamic uv;
  dynamic gustMph;
  dynamic gustKph;

  Current({
    this.lastUpdatedEpoch,
    this.lastUpdated,
    this.tempC,
    this.tempF,
    this.isDay,
    this.condition,
    this.windMph,
    this.windKph,
    this.windDegree,
    this.windDir,
    this.pressureMb,
    this.pressureIn,
    this.precipMm,
    this.precipIn,
    this.humidity,
    this.cloud,
    this.feelslikeC,
    this.feelslikeF,
    this.windchillC,
    this.windchillF,
    this.heatindexC,
    this.heatindexF,
    this.dewpodynamicC,
    this.dewpodynamicF,
    this.visKm,
    this.visMiles,
    this.uv,
    this.gustMph,
    this.gustKph,
  });

  factory Current.fromJson(Map<String, dynamic> json) => Current(
        lastUpdatedEpoch: json["last_updated_epoch"],
        lastUpdated: json["last_updated"],
        tempC: json["temp_c"],
        tempF: json["temp_f"],
        isDay: json["is_day"],
        condition: json["condition"] == null
            ? null
            : Condition.fromJson(json["condition"]),
        windMph: json["wind_mph"],
        windKph: json["wind_kph"],
        windDegree: json["wind_degree"],
        windDir: json["wind_dir"],
        pressureMb: json["pressure_mb"],
        pressureIn: json["pressure_in"],
        precipMm: json["precip_mm"],
        precipIn: json["precip_in"],
        humidity: json["humidity"],
        cloud: json["cloud"],
        feelslikeC: json["feelslike_c"],
        feelslikeF: json["feelslike_f"],
        windchillC: json["windchill_c"],
        windchillF: json["windchill_f"],
        heatindexC: json["heatindex_c"],
        heatindexF: json["heatindex_f"],
        dewpodynamicC: json["dewpodynamic_c"],
        dewpodynamicF: json["dewpodynamic_f"],
        visKm: json["vis_km"],
        visMiles: json["vis_miles"],
        uv: json["uv"],
        gustMph: json["gust_mph"],
        gustKph: json["gust_kph"],
      );

  Map<String, dynamic> toJson() => {
        "last_updated_epoch": lastUpdatedEpoch,
        "last_updated": lastUpdated,
        "temp_c": tempC,
        "temp_f": tempF,
        "is_day": isDay,
        "condition": condition?.toJson(),
        "wind_mph": windMph,
        "wind_kph": windKph,
        "wind_degree": windDegree,
        "wind_dir": windDir,
        "pressure_mb": pressureMb,
        "pressure_in": pressureIn,
        "precip_mm": precipMm,
        "precip_in": precipIn,
        "humidity": humidity,
        "cloud": cloud,
        "feelslike_c": feelslikeC,
        "feelslike_f": feelslikeF,
        "windchill_c": windchillC,
        "windchill_f": windchillF,
        "heatindex_c": heatindexC,
        "heatindex_f": heatindexF,
        "dewpodynamic_c": dewpodynamicC,
        "dewpodynamic_f": dewpodynamicF,
        "vis_km": visKm,
        "vis_miles": visMiles,
        "uv": uv,
        "gust_mph": gustMph,
        "gust_kph": gustKph,
      };
}

class Condition {
  String? text;
  String? icon;
  dynamic code;

  Condition({
    this.text,
    this.icon,
    this.code,
  });

  factory Condition.fromJson(Map<String, dynamic> json) => Condition(
        text: json["text"],
        icon: json["icon"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "icon": icon,
        "code": code,
      };
}

class CurrentLocationData {
  String? name;
  String? region;
  String? country;
  dynamic lat;
  dynamic lon;
  String? tzId;
  dynamic localtimeEpoch;
  String? localtime;

  CurrentLocationData({
    this.name,
    this.region,
    this.country,
    this.lat,
    this.lon,
    this.tzId,
    this.localtimeEpoch,
    this.localtime,
  });

  factory CurrentLocationData.fromJson(Map<String, dynamic> json) =>
      CurrentLocationData(
        name: json["name"],
        region: json["region"],
        country: json["country"],
        lat: json["lat"],
        lon: json["lon"],
        tzId: json["tz_id"],
        localtimeEpoch: json["localtime_epoch"],
        localtime: json["localtime"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "region": region,
        "country": country,
        "lat": lat,
        "lon": lon,
        "tz_id": tzId,
        "localtime_epoch": localtimeEpoch,
        "localtime": localtime,
      };
}
