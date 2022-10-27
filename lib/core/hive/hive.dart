import 'package:hive_flutter/hive_flutter.dart';

class HiveConfig {
  static String? read({required String box, required dynamic key}) {
    final db = Hive.box(box);
    return db.get(key);
  }

  static void write(
      {required String box,
      required dynamic key,
      required dynamic value}) async {
    final db = Hive.box(box);
    await db.put(key, value);
  }

  static void delete({required String box, required dynamic key}) async {
    final db = Hive.box(box);
    await db.delete(key);
  }
}
