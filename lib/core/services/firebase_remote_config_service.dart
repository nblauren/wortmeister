import 'package:firebase_remote_config/firebase_remote_config.dart';

class FirebaseRemoteConfigService {
  final FirebaseRemoteConfig _remoteConfig;

  FirebaseRemoteConfigService(this._remoteConfig);

  static Future<FirebaseRemoteConfigService> create() async {
    final remoteConfig = FirebaseRemoteConfig.instance;
    await remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: Duration(seconds: 10),
      minimumFetchInterval: Duration(hours: 1),
    ));
    await remoteConfig.fetchAndActivate();
    return FirebaseRemoteConfigService(remoteConfig);
  }

  String getString(String key) {
    return _remoteConfig.getString(key);
  }

  bool getBool(String key) {
    return _remoteConfig.getBool(key);
  }

  int getInt(String key) {
    return _remoteConfig.getInt(key);
  }

  double getDouble(String key) {
    return _remoteConfig.getDouble(key);
  }
}
