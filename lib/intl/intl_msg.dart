import 'package:get/get.dart';

class IntlMsgs extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "zh_CN": {
          "text": "我是中文Text",
        },
        "en_US": {
          "text": "I'm English Text",
        },
      };
}
