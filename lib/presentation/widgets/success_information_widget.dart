import 'package:flutter/material.dart';
import 'package:weather/domain/entity/success_information.dart';
import 'package:weather/presentation/styles.dart';

class BuildSuccessInformation extends StatelessWidget {
  const BuildSuccessInformation({
    Key? key,
    required this.data,
  }) : super(key: key);

  final SuccessInformation data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.transparent,
          backgroundImage:
              NetworkImage(data.imgUrl ?? "http://via.placeholder.com/200x150"),
        ),
        Text(
          data.cityName.toString(),
          style: bigTitleStyle.copyWith(fontSize: 38),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${data.condition}, ',
              style: bigTitleStyle.copyWith(fontSize: 16),
            ),
            Text(
              data.dateTime ?? "",
              style: bigTitleStyle.copyWith(fontSize: 18),
            )
          ],
        ),
        Text(
          data.description ?? "",
          style: bigTitleStyle.copyWith(fontSize: 16),
        ),
        Text(
          "${data.temp}°",
          style: bigTitleStyle.copyWith(fontSize: 100),
        ),
        Text(
          "Feels Like : ${data.feelsLike}°",
          style: bigTitleStyle.copyWith(fontSize: 16),
        )
        //
      ],
    );
  }
}
