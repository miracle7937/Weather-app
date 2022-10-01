class WeatherModel {
  Request? request;
  Location? location;
  Current? current;
  bool? local;

  WeatherModel({this.request, location, current, local});

  WeatherModel.fromJson(Map<dynamic, dynamic> json) {
    request =
        json['request'] != null ? Request.fromJson(json['request']) : null;
    location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
    current =
        json['current'] != null ? Current.fromJson(json['current']) : null;
    local = json["local"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (request != null) {
      data['request'] = request!.toJson();
    }
    if (location != null) {
      data['location'] = location!.toJson();
    }
    if (current != null) {
      data['current'] = current!.toJson();
    }
    return data;
  }
}

class Request {
  String? type;
  String? query;
  String? language;
  String? unit;

  Request({this.type, query, language, unit});

  Request.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    query = json['query'];
    language = json['language'];
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['query'] = query;
    data['language'] = language;
    data['unit'] = unit;
    return data;
  }
}

class Location {
  String? name;
  String? country;
  String? region;
  String? lat;
  String? lon;
  String? timezoneId;
  String? localtime;
  int? localtimeEpoch;
  String? utcOffset;

  Location(
      {this.name,
      country,
      region,
      lat,
      lon,
      timezoneId,
      localtime,
      localtimeEpoch,
      utcOffset});

  Location.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    country = json['country'];
    region = json['region'];
    lat = json['lat'];
    lon = json['lon'];
    timezoneId = json['timezone_id'];
    localtime = json['localtime'];
    localtimeEpoch = json['localtime_epoch'];
    utcOffset = json['utc_offset'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['country'] = country;
    data['region'] = region;
    data['lat'] = lat;
    data['lon'] = lon;
    data['timezone_id'] = timezoneId;
    data['localtime'] = localtime;
    data['localtime_epoch'] = localtimeEpoch;
    data['utc_offset'] = utcOffset;
    return data;
  }
}

class Current {
  String? observationTime;
  int? temperature;
  int? weatherCode;
  List<String>? weatherIcons;
  List<String>? weatherDescriptions;
  int? windSpeed;
  int? windDegree;
  String? windDir;
  int? pressure;
  int? precip;
  int? humidity;
  int? cloudcover;
  int? feelslike;
  int? uvIndex;
  int? visibility;
  String? isDay;

  Current(
      {this.observationTime,
      temperature,
      weatherCode,
      weatherIcons,
      weatherDescriptions,
      windSpeed,
      windDegree,
      windDir,
      pressure,
      precip,
      humidity,
      cloudcover,
      feelslike,
      uvIndex,
      visibility,
      isDay});

  Current.fromJson(Map<String, dynamic> json) {
    observationTime = json['observation_time'];
    temperature = json['temperature'];
    weatherCode = json['weather_code'];
    weatherIcons = json['weather_icons'].cast<String>();
    weatherDescriptions = json['weather_descriptions'].cast<String>();
    windSpeed = json['wind_speed'];
    windDegree = json['wind_degree'];
    windDir = json['wind_dir'];
    pressure = json['pressure'];
    precip = json['precip'];
    humidity = json['humidity'];
    cloudcover = json['cloudcover'];
    feelslike = json['feelslike'];
    uvIndex = json['uv_index'];
    visibility = json['visibility'];
    isDay = json['is_day'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['observation_time'] = observationTime;
    data['temperature'] = temperature;
    data['weather_code'] = weatherCode;
    data['weather_icons'] = weatherIcons;
    data['weather_descriptions'] = weatherDescriptions;
    data['wind_speed'] = windSpeed;
    data['wind_degree'] = windDegree;
    data['wind_dir'] = windDir;
    data['pressure'] = pressure;
    data['precip'] = precip;
    data['humidity'] = humidity;
    data['cloudcover'] = cloudcover;
    data['feelslike'] = feelslike;
    data['uv_index'] = uvIndex;
    data['visibility'] = visibility;
    data['is_day'] = isDay;
    return data;
  }
}
