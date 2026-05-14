import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class HiveManager {

  Future<Box<T>> openBox<T>(String boxName) async{
    if(Hive.isBoxOpen(boxName)){
      return Hive.box<T>(boxName);
    }
    return await Hive.openBox<T>(boxName);
  }

  Future<void> put<T>(String boxName,String key,T value) async{
    final box = await openBox<T>(boxName);
    await box.put(key, value);
  }

  Future<T?> get<T>(String boxName,String key) async{
    final box = await openBox<T>(boxName);
    return box.get(key);
  }
}