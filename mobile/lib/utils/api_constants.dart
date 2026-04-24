import 'dart:io';

class ApiConstants {
  // Use 10.0.2.2 for Android Emulator, localhost for iOS or Web
  static String get baseUrl {
    if (Platform.isAndroid) {
      return 'http://10.0.2.2:8080/api/v1';
    } else {
      return 'http://localhost:8080/api/v1';
    }
  }

  static const String itemsEndpoint = '/items';
  static const String wardrobesEndpoint = '/wardrobes';
}
