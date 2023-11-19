part of depths;

class DepthsStore {
  DepthsStore(this.prefs, this.secret);

  final SharedPreferences prefs;
  final String secret;

  Future<void> write<T>({
    required String key,
    required T value,
    required Map<String, dynamic> Function(T value) toJson,
    bool encrypted = false,
  }) async {
    final encoded = jsonEncode(toJson(value));
    final encryptedValue = encrypted ? encrypt(value: encoded, secret: secret) : encoded;
    await prefs.setString(key, encryptedValue);
  }

  Future<void> writeString({
    required String key,
    required String value,
    bool encrypted = false,
  }) async {
    final encryptedValue = encrypted ? encrypt(value: value, secret: secret) : value;
    await prefs.setString(key, encryptedValue);
  }

  String? readString({
    required String key,
    bool encrypted = false,
  }) {
    if (prefs.containsKey(key) == false) {
      return null;
    }

    final stored = prefs.getString(key);
    return encrypted ? decrypt(value: stored!, secret: secret) : stored;
  }

  T? read<T>({
    required String key,
    required T Function(Map<String, dynamic> json) fromJson,
    bool encrypted = false,
  }) {
    if (prefs.containsKey(key) == false) {
      return null;
    }

    final stored = prefs.getString(key);
    final decrypted = encrypted ? decrypt(value: stored!, secret: secret) : stored;
    return fromJson(jsonDecode(decrypted!));
  }

  Future<void> remove(String key) async {
    await prefs.remove(key);
  }
}
