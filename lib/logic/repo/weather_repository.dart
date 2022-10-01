import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/weather_model.dart';

class WeatherRepository {
  Future<WeatherModel?> getACityWeather(String city) async {
    var url = Uri.parse(
        "http://api.weatherstack.com/current?access_key=504dc2e5c05d56ca609fc016669a4fce&query=$city");
    var response = await http.get(url);
    Map<dynamic, dynamic> map = {
      "local": true,
      "request": {
        "type": "City",
        "query": "Beijing, China",
        "language": "en",
        "unit": "m"
      },
      "location": {
        "name": "Beijing",
        "country": "China",
        "region": "Beijing",
        "lat": "39.929",
        "lon": "116.388",
        "timezone_id": "Asia/Shanghai",
        "localtime": "2022-10-01 15:22",
        "localtime_epoch": 1664637720,
        "utc_offset": "8.0"
      },
      "current": {
        "observation_time": "07:22 AM",
        "temperature": 25,
        "weather_code": 113,
        "weather_icons": [
          "https://assets.weatherstack.com/images/wsymbols01_png_64/wsymbol_0001_sunny.png"
        ],
        "weather_descriptions": ["Sunny"],
        "wind_speed": 15,
        "wind_degree": 140,
        "wind_dir": "SE",
        "pressure": 1012,
        "precip": 0,
        "humidity": 65,
        "cloudcover": 0,
        "feelslike": 26,
        "uv_index": 6,
        "visibility": 6,
        "is_day": "yes"
      }
    };
    print(response.body);
    print(map);
    Map body = jsonDecode(response.body);
    if (response.statusCode == 200) {
      if (body["success"] == false) {
        return WeatherModel.fromJson(map);
      } else {
        return WeatherModel.fromJson(
          body,
        );
      }
    } else {
      throw Exception("fail to get weather condition for this location");
    }
  }
}
