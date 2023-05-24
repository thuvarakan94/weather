import 'package:flutter/material.dart';
import 'package:weather/domain/entity/success_detail_information.dart';
import 'package:weather/presentation/widgets/detail_block.dart';

class BuildSuccessDetailInformation extends StatelessWidget {
  const BuildSuccessDetailInformation({
    required this.data,
    Key? key,
  }) : super(key: key);

  final SuccessDetailInformation data;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        physics: const BouncingScrollPhysics(),
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: <Widget>[
          DetailBlock(
            icon: const Icon(Icons.air_outlined, size: 36),
            title: "Wind",
            value: data.windValue,
            unit: "m/s",
            color: Colors.amber[100],
          ),
          DetailBlock(
            icon: const Icon(Icons.opacity, size: 36),
            title: "Humidity",
            value: '${data.humidityValue} %',
            color: Colors.amber[200],
          ),
          DetailBlock(
            icon: const Icon(Icons.fast_forward, size: 36),
            title: "Gust",
            unit: "m/s",
            value: data.gustValue,
            color: Colors.amber[300],
          ),
          DetailBlock(
            icon: const Icon(Icons.speed, size: 36),
            title: "Pressure",
            unit: "hPa",
            value: data.pressureValue,
            color: Colors.amber[400],
          ),
          DetailBlock(
            icon: const Icon(Icons.brightness_7, size: 36),
            title: "Sunrise",
            value: data.sunriseValue,
            color: Colors.amber[500],
          ),
          DetailBlock(
            icon: const Icon(Icons.brightness_3, size: 36),
            title: "Sunset",
            value: data.sunsetValue,
            color: Colors.amber[600],
          ),
        ],
      ),
    );
  }
}
