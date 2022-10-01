import 'package:flutter/material.dart';
import 'package:glade_app/utils/page_enum.dart';

import '../model/weather_model.dart';
import '../repo/weather_repository.dart';

class WeatherController with ChangeNotifier {
  List<String> cities = ["Abuja", "Lagos", "China", "London", "New York"];
  WeatherModel? weatherModel;
  PageState pageState = PageState.loaded;
  OnFetchView? _onFetchView;
  String get selectedCity => _selectedCity ?? cities.first;
  String? _selectedCity;

  set setCity(v) {
    _selectedCity = v;
    notifyListeners();
  }

  setView(v) {
    _onFetchView = v;
  }

  init() {
    if (weatherModel == null) {
      pageState = PageState.loading;
      fetch(cities.first);
    }
  }

  getNewLocation(String city) {
    pageState = PageState.loading;
    notifyListeners();
    fetch(city);
  }

  fetch(String city) {
    WeatherRepository().getACityWeather(city).then((value) {
      pageState = PageState.loaded;
      notifyListeners();
      if (value!.request != null) {
        weatherModel = value;

        if (value.local == true) {
          _onFetchView!
              .onError("Your (API KEY) monthly usage limit has been reached ");
        }
      } else {
        _onFetchView!.onError("An error occurred");
      }
    }).catchError((c) {
      _onFetchView!.onError(c.toString());
      pageState = PageState.loaded;
      notifyListeners();
    });
  }
}

abstract class OnFetchView {
  onSuccess();
  onError(String message);
}
