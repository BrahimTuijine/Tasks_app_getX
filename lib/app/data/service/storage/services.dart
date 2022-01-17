import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_test/app/core/utils/keys.dart';

class StorageService extends GetxService {
  late GetStorage _box;
  Future<StorageService> init() async {
    _box = GetStorage();
    await _box.writeIfNull(taskkey, []);
    return this;
  }

  // read from get_storage
  T read<T>(String key) => _box.read(key);

  // write to get_storage
  void write(String key, dynamic value) async {
    await _box.write(key, value);
  }
}
