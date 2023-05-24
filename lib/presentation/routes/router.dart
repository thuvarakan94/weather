import 'package:auto_route/auto_route.dart';
import 'package:weather/presentation/Pages/details_page.dart';
import 'package:weather/presentation/Pages/my_home_page.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(page: MyHomePage, initial: true),
    AutoRoute(page: DetailsPage),
  ],
)
class $AppRouter {}
