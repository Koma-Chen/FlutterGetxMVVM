import 'package:flutterdemo/model/login/login_bean.dart';

loginBeanFromJson(LoginBean data, Map<String, dynamic> json) {
	if (json['expire'] != null) {
		data.expire = json['expire'].toString();
	}
	if (json['token'] != null) {
		data.token = json['token'].toString();
	}
	return data;
}

Map<String, dynamic> loginBeanToJson(LoginBean entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['expire'] = entity.expire;
	data['token'] = entity.token;
	return data;
}