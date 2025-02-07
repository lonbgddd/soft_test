class AppDatabase {
  AppDatabase._();

  static final AppDatabase _instance = AppDatabase._();

  final Map<String, dynamic> _cache = {};
  static int _counter = 0;

  static AppDatabase get instance => _instance;

  void setCache(dynamic value) {
    _cache['${getNextId()}'] = value;
  }

  Map<String, dynamic> getCache() {
    return _cache;
  }

  dynamic getCacheSize() {
    return _cache.length;
  }

  static int getNextId() {
    _counter++;
    return _counter;
  }

  bool hasCache(String key) {
    return _cache.containsKey(key);
  }

  void removeCache(String key) {
    _cache.remove(key);
  }

  void clearCache() {
    _cache.clear();
  }
}
