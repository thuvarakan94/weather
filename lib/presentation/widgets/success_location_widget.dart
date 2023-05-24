import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather/presentation/routes/router.gr.dart';
import 'package:weather/presentation/styles.dart';
import 'package:weather/providers.dart';

class BuildSucessLocation extends ConsumerWidget {
  final String cityName;

  const BuildSucessLocation({
    super.key,
    required this.cityName,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Text(cityName, style: bigTitleStyle.copyWith(fontSize: 25)),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            ref.read(cityNameProvider.notifier).state = cityName;
            WidgetsBinding.instance.addPostFrameCallback((_) {
              context.router.push(const DetailsPageRoute());
            });
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white10,
              padding: const EdgeInsets.all(15)),
          child: const Text(
            'Tap to see more!',
            style: TextStyle(color: Colors.white54),
          ),
        ),
      ],
    );
  }
}
