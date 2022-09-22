import 'package:flutterdemo/page/main/data/login_bean.dart';
import 'package:flutterdemo/page/main/service/main_service.dart';

class MainServiceMockImpl implements MainService {
  @override
  Future<T> login<T>(String phone, int smsCode, String code, String type,
      String appleId) async {
    final loginBean = LoginBean()
      ..expire = "expire"
      ..token = "token";
    return loginBean as T;
  }
}
