import 'package:get/get.dart';
import 'package:music_app/app/ui/pages/home_page/home_page_view.dart';
import 'package:music_app/app/ui/pages/player_page/player_page_view.dart';

import '../ui/pages/artist_page/artists_page.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  // ignore: constant_identifier_names
  static const INITIAL = AppRoutes.home;

  static final routes = [
    GetPage(
      name: _Paths.homePage,
      page: () => const HomePage(),
    ),
    GetPage(
      name: _Paths.playerPage,
      page: () => const PlayerPage(),
    ),
    GetPage(
      name: _Paths.artistPage,
      page: () => const ArtistsPage(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
  ];
}
