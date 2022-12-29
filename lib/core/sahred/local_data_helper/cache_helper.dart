import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper{
  static SharedPreferences? sp;

  static inti()async{
    try{
      sp = await SharedPreferences.getInstance();
    }catch(e){
      print('=== catch:=> $e ===');
    }
  }

  static bool getThemeFromSP(key){
    return sp?.getBool(key)??false;
  }

  static void setThemeMode(key, value)async{
    await sp?.setBool(key, value);
  }
}