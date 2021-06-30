import 'package:flutterdemo/model/login/login_bean.dart';

loginBeanFromJson(LoginBean data, Map<String, dynamic> json) {
	if (json['domain'] != null) {
		data.domain = json['domain'].toString();
	}
	if (json['token'] != null) {
		data.token = json['token'].toString();
	}
	return data;
}

Map<String, dynamic> loginBeanToJson(LoginBean entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['domain'] = entity.domain;
	data['token'] = entity.token;
	return data;
}