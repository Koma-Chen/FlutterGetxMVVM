import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SPUtils {
  static final SPUtils _instance = SPUtils._internal();

  factory SPUtils() => _instance;

  SPUtils._internal();

  static late SharedPreferences _preferences;

  static Future<SharedPreferences> init() async =>
      _preferences = await SharedPreferences.getInstance();

  Future setLocalStorage<T>(String key, T value) async {
    final String type = value.runtimeType.toString();

    switch (type) {
      case "String":
        await _setString(key, value as String);
        break;
      case "int":
        await _setInt(key, value as int);
        break;
      case "bool":
        await _setBool(key, value as bool);
        break;
      case "double":
        await _setDouble(key, value as double);
        break;
      case "List<String>":
        await _setStringList(key, value as List<String>);
        break;
      case "_InternalLinkedHashMap<String, String>":
        await _setMap(key, value as Map);
        break;
    }
  }

  /// 获取持久化数据
  dynamic getLocalStorage<T>(String key) {
    final dynamic value = _preferences.get(key);
    if (value.runtimeType.toString() == "String") {
      if (_isJson(value)) {
        return json.decode(value);
      }
    }
    return value;
  }

  /// 根据key存储int类型
  Future<bool> _setInt(String key, int value) {
    return _preferences.setInt(key, value);
  }

  /// 根据key获取int类型
  int? getInt(String key, {int defaultValue = 0}) {
    return _preferences.getInt(key) ?? defaultValue;
  }

  /// 根据key存储double类型
  Future<bool> _setDouble(String key, double value) {
    return _preferences.setDouble(key, value);
  }

  /// 根据key获取double类型
  double? getDouble(String key, {double defaultValue = 0.0}) {
    return _preferences.getDouble(key) ?? defaultValue;
  }

  /// 根据key存储字符串类型
  Future<bool> _setString(String key, String value) {
    return _preferences.setString(key, value);
  }

  /// 根据key获取字符串类型
  String getString(String key, {String defaultValue = ""}) {
    return _preferences.getString(key) ?? defaultValue;
  }

  /// 根据key存储布尔类型
  Future<bool> _setBool(String key, bool value) {
    return _preferences.setBool(key, value);
  }

  /// 根据key获取布尔类型
  bool? getBool(String key, {bool defaultValue = false}) {
    return _preferences.getBool(key) ?? defaultValue;
  }

  /// 根据key存储字符串类型数组
  Future<bool> _setStringList(String key, List<String> value) {
    return _preferences.setStringList(key, value);
  }

  /// 根据key获取字符串类型数组
  List<String> getStringList(String key,
      {List<String> defaultValue = const []}) {
    return _preferences.getStringList(key) ?? defaultValue;
  }

  /// 根据key存储Map类型
  Future<bool> _setMap(String key, Map value) {
    return _preferences.setString(key, json.encode(value));
  }

  /// 根据key获取Map类型
  Map getMap(String key) {
    final String jsonStr = _preferences.getString(key) ?? "";
    return jsonStr.isEmpty ? Map : json.decode(jsonStr);
  }

  /// 获取持久化数据中所有存入的key
  Set<String> getKeys() {
    return _preferences.getKeys();
  }

  /// 获取持久化数据中是否包含某个key
  bool containsKey(String key) {
    return _preferences.containsKey(key);
  }

  /// 删除持久化数据中某个key
  Future<bool> remove(String key) async {
    return _preferences.remove(key);
  }

  /// 清除所有持久化数据
  Future<bool> clear() async {
    return _preferences.clear();
  }

  /// 重新加载所有数据,仅重载运行时
  Future<void> reload() async {
    return _preferences.reload();
  }

  /// 判断是否是json字符串
  bool _isJson(String value) {
    try {
      JsonDecoder().convert(value);
      return true;
    } catch (e) {
      return false;
    }
  }
}
