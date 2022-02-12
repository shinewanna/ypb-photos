import 'package:hive/hive.dart';

class CacheProvider {
  CacheProvider._();
  static final _box = Hive.box(_cache);

  static const _cache = 'cache';
  static const height = 'height';
  static const width = 'width';
  static const photosLimit = 'photosLimit';
  static const exposure = 'exposure';

  static Future<void> open() => Hive.openBox(_cache);

  static Future<void> setValue(String key, value) => _box.put(key, value);

  static getValue(String key, {String? defaultValue}) =>
      _box.get(key, defaultValue: defaultValue);

  static clear() => _box.clear();
}

extension StringExt on String? {
  static final _box = Hive.box(CacheProvider._cache);

  Future<void> setValue(value) => _box.put(this, value);

  getValue({defaultValue}) => _box.get(this, defaultValue: defaultValue);
}
