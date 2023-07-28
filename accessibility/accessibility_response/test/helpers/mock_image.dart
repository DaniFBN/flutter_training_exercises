import 'package:network_image_mock/network_image_mock.dart';

typedef AsyncVoidCallback = Future<void> Function();

Future<void> mockImage(AsyncVoidCallback callback) async {
  await mockNetworkImagesFor(callback);
}
