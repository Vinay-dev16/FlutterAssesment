import '../../main.dart';

class ApiConstants {
  // Replace these with your actual dev and live URLs
  static const String _devBaseUrl = 'https://dev.reqres.in/api';
  static const String _qaBaseUrl = 'https://qa.reqres.in/api';
  static const String _liveBaseUrl = 'https://reqres.in/api';

  static String get baseUrl {
    switch (appBuildVariant) {
      case AppBuildVariant.debug:
        return _devBaseUrl;
      case AppBuildVariant.qa:
        return _qaBaseUrl;
      case AppBuildVariant.release:
        return _liveBaseUrl;
    }
  }

  // Auth endpoints
  static const String login = '/login';

  // Users endpoints
  static const String users = '/users';
}
