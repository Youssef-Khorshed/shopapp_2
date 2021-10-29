import 'dart:ffi';

import 'package:shared_preferences/shared_preferences.dart';

class Preference{

  static SharedPreferences? sharedPreferences;
  static  intial()
   async {
     sharedPreferences = await SharedPreferences.getInstance();
   }
static Future<bool> put({required key ,required value})
async {
if(value is String) return await sharedPreferences!.setString(key, value);
else if(value is int) return await sharedPreferences!.setInt(key, value);
else if(value is double) return await sharedPreferences!.setDouble(key, value);
else if(value is bool)  return await sharedPreferences!.setBool(key, value);
else return await sharedPreferences!.setStringList(key, value);

}
static dynamic get({required key})
{
  return sharedPreferences!.get(key);
}
  static List<String>? geter({required key})
  {
    return sharedPreferences!.getStringList(key);
  }
}