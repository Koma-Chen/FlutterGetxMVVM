import 'package:flutterdemo/intl/intl_constant.dart';
import 'package:get/get.dart';

class IntlMsgs extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "zh_CN": {
          IntlConstant.HOME: "首页",
        },
        "en_US": {
          IntlConstant.HOME: "home",
        },
      };
}
