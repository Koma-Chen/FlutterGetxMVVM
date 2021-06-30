import 'package:flutterdemo/model/login/login_bean.dart';
import 'package:flutterdemo/mvvm/base/base_view_model.dart';
import 'package:flutterdemo/service/repository.dart';
import 'package:flutterdemo/util/log_util.dart';

class MainViewModel extends BaseViewModel {
  LoginBean bean = LoginBean();

  Future<bool> login() async {
    try {
      setBusy();
      bean = await Repository.login("13243756407", 666666, "", "", "");
      setIdle();
      LogUtil.e("登录成功:$bean");
      return true;
    } catch (e) {
      return false;
    }
  }
}
