import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:glade_app/utils/images.dart';
import 'package:glade_app/utils/page_enum.dart';
import 'package:glade_app/view/widget/drop_down_selector.dart';
import 'package:glade_app/view/widget/weather_detail_container.dart';

import '../logic/controller/weather_controller.dart';
import '../logic/manager/manager.dart';
import '../utils/snack_bar.dart';

class WeatherDetailScreen extends ConsumerWidget with OnFetchView {
  WeatherDetailScreen({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WeatherController weatherController = ref.watch(weatherManager)
      ..setView(this)
      ..init();
    if (weatherController.pageState == PageState.loading) {
      return Scaffold(
        key: _scaffoldKey,
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: const Center(
              child: CupertinoActivityIndicator(
            color: CupertinoColors.activeBlue,
          )),
        ),
      );
    }
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: Container(
          color: const Color.fromRGBO(0, 146, 209, 1),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 12,
                    ),
                    CustomPopupMenuButton(
                      cities: weatherController.cities,
                      handleClick: (v) {
                        weatherController.setCity = v;
                        weatherController.getNewLocation(v);
                      },
                    ),
                    const SizedBox(
                      width: 13,
                    ),
                    Text(
                      weatherController.selectedCity,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Image.asset(KAImages.weather),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Tap on location icon to search for weather condition in other location",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 15,
                ),
                WeatherDetailContainer(
                  weatherModel: weatherController.weatherModel,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  onError(String message) async {
    await showSnackBar(message, null, key: _scaffoldKey);
  }

  @override
  onSuccess() {}
}
