import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/utils/api_constants.dart';

void main() {
  group('ApiConstants', () {
    test('endpoints should be correctly defined', () {
      expect(ApiConstants.itemsEndpoint, '/items');
      expect(ApiConstants.wardrobesEndpoint, '/wardrobes');
    });

    test('baseUrl should return a string', () {
      // Platform.isAndroid check is hard to mock without extra dependencies,
      // but we can at least verify it returns a valid URL string.
      expect(ApiConstants.baseUrl, isA<String>());
      expect(ApiConstants.baseUrl, contains('http://'));
    });
  });
}
