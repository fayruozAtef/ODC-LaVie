import 'package:shared_preferences/shared_preferences.dart';

class CashHelper{
  static late SharedPreferences? sharedPreferences;

  static init() async{
    sharedPreferences= await SharedPreferences.getInstance();
  }

  static dynamic getData({
    required SharedKeys key
  })
  {
    return  sharedPreferences!.get(key.name);
  }

  static Future<bool> saveData({
    required SharedKeys key,
    required dynamic value,
  }) async{
    if(value is String) { return await sharedPreferences!.setString('${key.name}', value); }
    else if(value is int) { return await sharedPreferences!.setInt('${key.name}', value); }
    else if (value is double) { return await sharedPreferences!.setDouble('${key.name}', value); }
    return await sharedPreferences!.setBool('${key.name}', value);
  }

  static Future<bool> clearData({required SharedKeys key,}) async{
    return sharedPreferences!.remove(key.name);
  }

}

enum SharedKeys{
  CURRENT_API,
}