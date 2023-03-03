import 'package:flutterdemo/config/route_config.dart';
import 'package:flutterdemo/intl/intl_msg.dart';
import 'package:flutterdemo/page/splash_page.dart';
import 'package:flutterdemo/theme/app_theme.dart';
import 'package:flutterdemo/util/address_manager.dart';
import 'package:flutterdemo/util/http/http_client.dart';
import 'package:flutterdemo/util/http/http_config.dart';
import 'package:flutterdemo/util/method_channel_util.dart';
import 'package:flutterdemo/util/sp_util/shared_preferences.dart';
import 'package:flutterdemo/util/sp_util/sp_key.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SPUtils.init();
  MethodChannelUtil().init();
  runApp(MyApp());
  final HttpConfig dioConfig = HttpConfig(
    baseUrl: AddressManager.BASE_URL,
    connectTimeout: Duration(seconds: 15),
    receiveTimeout: Duration(seconds: 15),
    sendTimeout: Duration(seconds: 15),
  );
  final HttpClient client = HttpClient(dioConfig: dioConfig);

  /// 网络请求
  Get.put<HttpClient>(client);

  /// 竖屏
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setEnabledSystemUIOverlays(
      [SystemUiOverlay.top, SystemUiOverlay.bottom]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
          theme: AppTheme.lightTheme,
          locale: getLocale(),
          fallbackLocale: Locale("en", "US"),
          translations: IntlMsgs(),
          getPages: RouteConfig.getPages,
          navigatorObservers: [FlutterSmartDialog.observer],
          builder: FlutterSmartDialog.init(),
          initialRoute: "/",
          home: child,
        ),
        child: SplashPage(),
      ),
    );
  }

  Locale? getLocale() {
    final localeStr = SPUtils().getString(SpKey.LANGUAGE);
    if (localeStr.isEmpty) return Get.deviceLocale;
    if (localeStr == "zh_CN") {
      return Locale("zh", "CN");
    } else {
      return Locale("en", "US");
    }
  }
}
