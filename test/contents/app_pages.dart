const appPagesContent = '''
import 'package:get/get.dart';
import 'package:pizzadym/app/modules/home/home_binding.dart';
import 'package:pizzadym/app/modules/home/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.home;

  static final routes = [
    GetPage(
      name: _Paths.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
  ];
}
''';

const appPagesContentExpected = '''
import 'package:get/get.dart';
import 'package:pizzadym/app/modules/home/home_binding.dart';
import 'package:pizzadym/app/modules/home/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.home;

  static final routes = [
    GetPage(
      name: _Paths.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.auth,
      page: () => const AuthView(),
      binding: AuthBinding(),
    ),
  ];
}
''';

const String getPageElement = '''
    GetPage(
      name: _Paths.auth,
      page: () => const AuthView(),
      binding: AuthBinding(),
    ),''';
