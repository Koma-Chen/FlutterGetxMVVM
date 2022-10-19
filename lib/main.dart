import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutterdemo/config/resource_mananger.dart';
import 'package:flutterdemo/config/route_config.dart';
import 'package:flutterdemo/intl/intl_msg.dart';
import 'package:flutterdemo/page/splash_page.dart';
import 'package:flutterdemo/util/address_manager.dart';
import 'package:flutterdemo/util/http/http_client.dart';
import 'package:flutterdemo/util/http/http_config.dart';
import 'package:flutterdemo/util/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
  final HttpConfig dioConfig = HttpConfig(
      baseUrl: AddressManager.BASE_URL,
      connectTimeout: 10000,
      receiveTimeout: 10000,
      sendTimeout: 10000);
  final HttpClient client = HttpClient(dioConfig: dioConfig);
  Get.put<HttpClient>(client);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setEnabledSystemUIOverlays(
      [SystemUiOverlay.top, SystemUiOverlay.bottom]);
  //指定在应用程序运行时可见的系统叠加，主要对状态栏的操作
  //设置顶部状态栏属性，颜色：透明；图标：黑色
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light));
  SPUtils.init();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeData = ThemeData(
      textTheme: const TextTheme(
          subtitle1: TextStyle(textBaseline: TextBaseline.alphabetic)),
      primaryColor: ColorsHelper.primaryColor,
      accentColor: ColorsHelper.primaryColor,
    );

    return RefreshConfiguration(
      hideFooterWhenNotFull: true,
      //列表数据不满一页,不触发加载更多

      headerBuilder: () => const ClassicHeader(
        idleText: "下拉可刷新",
        releaseText: "释放可刷新",
        refreshingText: "刷新中",
        completeText: "刷新完成",
      ),
      footerBuilder: () => const ClassicFooter(
        failedText: "加载失败，请点击重试",
        idleText: "上拉加载更多",
        loadingText: "加载中...",
        noDataText: "没有更多数据了",
        canLoadingText: "释放以便加载更多",
      ),
      child: ScreenUtilInit(
        designSize: const Size(750, 1624),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => GetMaterialApp(
          locale: Get.deviceLocale,
          fallbackLocale: Locale("zh", "CN"),
          translations: IntlMsgs(),
          getPages: RouteConfig.getPages,
          showPerformanceOverlay: false,
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate
          ],
          supportedLocales: [const Locale("zh", "CN")],
          navigatorObservers: [FlutterSmartDialog.observer],
          builder: FlutterSmartDialog.init(),
          initialRoute: "/",
          theme: themeData,
          home: child,
        ),
        child: SplashPage(),
      ),
    );
  }
}
