import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../logic/model/weather_model.dart';
import '../../utils/images.dart';
import '../../utils/shadow_text.dart';

class WeatherDetailContainer extends StatelessWidget {
  final WeatherModel? weatherModel;
  const WeatherDetailContainer({Key? key, this.weatherModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle style = const TextStyle(color: Colors.white, fontSize: 18);
    String dataTime = DateFormat.yMMMMEEEEd()
        .format(DateTime.parse(weatherModel!.location!.localtime!));
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.4,
      width: MediaQuery.of(context).size.width * 0.8,
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.3,
            decoration: BoxDecoration(
                color: Colors.grey.shade200.withOpacity(0.5),
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1, color: Colors.white)),
            child: Center(
                child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 10),
              child: Column(
                children: [
                  ShadowText(
                    'Today, $dataTime',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ShadowText(
                    '${weatherModel?.current?.temperature}°',
                    style: TextStyle(color: Colors.white, fontSize: 62),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ShadowText(
                    '${weatherModel?.current?.weatherDescriptions?.first}',
                    style: const TextStyle(color: Colors.white, fontSize: 21),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(KAImages.wind),
                      const SizedBox(
                        width: 5,
                      ),
                      ShadowText(
                        'Wind',
                        style: style,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      ShadowText(
                        '|',
                        style: style,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      ShadowText(
                        '${weatherModel?.current?.windSpeed}Km',
                        style: style,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(KAImages.humidity),
                      const SizedBox(
                        width: 5,
                      ),
                      ShadowText(
                        'HUM',
                        style: style,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      ShadowText(
                        '|',
                        style: style,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      ShadowText(
                        '${weatherModel?.current?.humidity}%',
                        style: style,
                      ),
                    ],
                  )
                ],
              ),
            )),
          ),
        ),
      ),
    );
  }
}
