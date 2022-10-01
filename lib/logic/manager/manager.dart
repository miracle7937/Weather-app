import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controller/weather_controller.dart';

final weatherManager = ChangeNotifierProvider<WeatherController>((ref) {
  return WeatherController();
});
