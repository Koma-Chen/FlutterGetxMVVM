abstract class MainService {
  Future<T?> login<T>(
      String phone, int smsCode, String code, String type, String appleId);
}
