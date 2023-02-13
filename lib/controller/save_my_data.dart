import 'package:shared_preferences/shared_preferences.dart';

class SaveMyData {
  // static String memeKey = "MEMEKEY";

  // // method created for saving data
  // static Future<bool> saveData(int val) async {
  //   final sp = await SharedPreferences.getInstance();
  //   return await sp.setInt(memeKey, val);
  // }

  // // fetch data
  // static Future<int?> fetchData() async {
  //   final sp = await SharedPreferences.getInstance();
  //   return await sp.getInt(memeKey);
  // }

  static saveData(int val) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setInt('MEME', val);
  }

  static fetchData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    //Return int
    int? intValue = sp.getInt('MEME');
    return intValue;
  }
}
