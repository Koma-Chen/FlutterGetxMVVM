import 'package:flutterdemo/page/main/main_page.dart';
import 'package:get/get.dart';

enum RouteName {
  mainPage,
}

class RouteConfig {
  ///别名映射页面
  static final List<GetPage> getPages = [
    GetPage(name: "/${RouteName.mainPage.toString()}", page: () => MainPage()),
  ];
}
