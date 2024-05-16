import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CashHelper{

  static const storage= FlutterSecureStorage();

  static const String uId='token';

  static Future setDataMorePrivet({required String tokenValue})async{
    await storage.write(key: uId,value: tokenValue);
  }

  static Future<String?> readData()async{
    return  await storage.read(key:uId);

  }
  static Future<void> deleteData()async{
    await storage.delete(key: uId);
  }
}