import 'package:hive_flutter/hive_flutter.dart';

class HiveFunctions {
 static Future<int> create({required String value}) async {
    final box = await Hive.openBox("dbBox");
    int key = await box.add(value);
    return key;
  }

 static Future<String> read({required int key}) async {
    final box = await Hive.openBox("dbBox");
    String data = await box.get(key);
    return data;
  }

static  Future<dynamic> update({required int key, required String value}) async {
    final box = await Hive.openBox("dbBox");
    await box.put(key, value);
    return key;
  }

static Future  delete({required int key}) async {
    final box = await Hive.openBox("dbBox");
    await box.delete(key);
  }
}
