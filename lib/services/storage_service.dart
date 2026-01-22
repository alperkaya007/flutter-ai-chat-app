import 'package:hive_flutter/hive_flutter.dart';

class StorageService {
  static const String _box = 'conversations';
  Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox<dynamic>(_box);
  }
  Future<void> save(String id, Map<String, dynamic> data) async =>
      Hive.box<dynamic>(_box).put(id, data);
  Map<String, dynamic>? get(String id) =>
      Hive.box<dynamic>(_box).get(id) as Map<String, dynamic>?;
  List<dynamic> getAll() => Hive.box<dynamic>(_box).values.toList();
  Future<void> delete(String id) async =>
      Hive.box<dynamic>(_box).delete(id);
}
