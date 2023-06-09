import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather/domain/entity/success_detail_information.dart';
import 'package:weather/domain/entity/success_information.dart';
import 'package:weather/domain/helper/extensions.dart';
import 'package:weather/infrastructure/Model/weather_model/weather_data.dart';
import 'package:weather/presentation/styles.dart';
import 'package:weather/presentation/widgets/success_detail_information_widget.dart';
import 'package:weather/presentation/widgets/success_information_widget.dart';
import 'package:weather/providers.dart';

class DetailsPage extends ConsumerWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cityName = ref.watch(cityNameProvider);
    final weatherState = ref.watch(weatherProvider(cityName));
    final isSuccessful = weatherState.maybeWhen(
      data: (data) => true,
      orElse: () => false,
    );

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: RefreshIndicator(
          onRefresh: () async {
            return await ref
                .refresh(weatherProvider(cityName).notifier)
                .getWeather(cityName);
          },
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  height: context.height / 2,
                  decoration: detailsBgDecoration,
                ),
                Container(
                  height: context.height,
                  decoration: detailsBgDecorationWithGradient,
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: Container(
                    height: 40,
                    width: 40,
                    padding: const EdgeInsets.only(left: 4),
                    decoration: backButtonDecoration,
                    child: IconButton(
                      onPressed: () {
                        WidgetsBinding.instance
                            .addPostFrameCallback((timeStamp) {
                          Navigator.pop(context);
                        });
                      },
                      icon: const Icon(Icons.arrow_back_ios),
                    ),
                  ),
                ),
                Positioned(
                  child: weatherState.maybeWhen(
                    loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    data: (data) => SizedBox(
                      width: context.width,
                      height: context.height / 2.0,
                      child: BuildSuccessInformation(
                        key: GlobalObjectKey(cityName.toString()),
                        data: SuccessInformation.fromWeatherData(data),
                      ),
                    ),
                    failed: (e) {
                      return Container(
                        margin: const EdgeInsets.only(top: 140),
                        alignment: Alignment.center,
                        child: Text(
                          e.toString(),
                          style: bigTitleStyle,
                        ),
                      );
                    },
                    orElse: () => const CircularProgressIndicator(),
                  ),
                ),
                Positioned(
                  top: context.height / 2,
                  child: Container(
                    height: context.height / 2,
                    width: context.width,
                    padding: const EdgeInsets.only(left: 45, top: 20),
                    decoration: const BoxDecoration(
                      color: Color(0xff14141C),
                    ),
                    child: isSuccessful
                        ? Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const CircleAvatar(
                                    radius: 10,
                                    backgroundColor: Colors.white,
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    "Weather Details",
                                    style: bigTitleStyle.copyWith(fontSize: 16),
                                  )
                                ],
                              ),
                              const SizedBox(height: 10),
                              weatherState.maybeWhen(
                                loading: () => const Center(
                                  child: CircularProgressIndicator(),
                                ),
                                data: (WeatherData weatherData) =>
                                    BuildSuccessDetailInformation(
                                  data:
                                      SuccessDetailInformation.fromWeatherData(
                                    weatherData,
                                  ),
                                ),
                                failed: (e) => Text(e.toString()),
                                orElse: () => Container(),
                              ),
                            ],
                          )
                        : const SizedBox(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
