import 'package:get_storage/get_storage.dart';

mixin StorageMixin {
  String? storageRead({
    required String container,
    required String key,
  }) {
    final storage = GetStorage(container);
    return storage.read(key);
  }

  Future<void> storageWrite({
    required String container,
    required String key,
    required String value,
  }) async {
    final storage = GetStorage(container);
    return storage.write(key, value);
  }
}
