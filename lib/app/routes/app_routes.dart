part of 'app_pages.dart';

abstract class AppRoutes {
  AppRoutes._();
  static const mainPage = _Paths.mainPage;
  static const home = _Paths.homePage;
  static const player = _Paths.playerPage;
  static const artistPage = _Paths.artistPage;
}

abstract class _Paths {
  _Paths._();
  static const mainPage = '/mainPage';
  static const homePage = '/homePage';
  static const playerPage = '/playerPage';
  static const artistPage = '/artistPage';
}
