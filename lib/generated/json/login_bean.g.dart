import 'package:flutterdemo/generated/json/base/json_convert_content.dart';
import 'package:flutterdemo/page/main/data/login_bean.dart';

LoginBean $LoginBeanFromJson(Map<String, dynamic> json) {
	final LoginBean loginBean = LoginBean();
	final String? token = jsonConvert.convert<String>(json['token']);
	if (token != null) {
		loginBean.token = token;
	}
	final String? expire = jsonConvert.convert<String>(json['expire']);
	if (expire != null) {
		loginBean.expire = expire;
	}
	return loginBean;
}

Map<String, dynamic> $LoginBeanToJson(LoginBean entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['token'] = entity.token;
	data['expire'] = entity.expire;
	return data;
}