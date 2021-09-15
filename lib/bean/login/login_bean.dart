import 'package:flutterdemo/generated/json/base/json_convert_content.dart';

class LoginBean with JsonConvert<LoginBean> {
	 String? expire;
	 String? token;

	 @override
  String toString() {
    return 'LoginBean{expire: $expire, token: $token}';
	 }
}
