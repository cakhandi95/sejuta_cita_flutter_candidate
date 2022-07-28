import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

///
/// Created by handy on 04/03/22
/// HP ProBook G1 430
/// it.handy@borwita.co.id
///

class SharedPref {

  static const String PROFILE_NIK = "profile_nik";
  static const String ADS_ID_GOOGLE = "ads_id_google";
  static const String INFO_DEVICES_ANDROID = "info_devices_android";
  static const String INFO_DEVICES_IOS = "info_devices_ios";
  static const String T0KEN_FIREBASE_MOBILE = "token_firebase_mobile";

  static Future<bool> saveNIKlUser(String s) async {
    var ref = await SharedPreferences.getInstance();
    return ref.setString(PROFILE_NIK,s);
  }

  static Future<bool> saveInfoDevicesAndroid(Map<String, dynamic> allInfoDevices) async {
    var ref = await SharedPreferences.getInstance();
    String encodedMap = json.encode(allInfoDevices);
    return ref.setString(INFO_DEVICES_ANDROID,encodedMap);
  }

  static Future<bool> saveInfoDevicesIOS(Map<String, dynamic> allInfoDevices) async {
    var ref = await SharedPreferences.getInstance();
    String encodedMap = json.encode(allInfoDevices);
    return ref.setString(INFO_DEVICES_IOS,encodedMap);
  }

  static Future<bool> saveAdsIDGoogle(String s) async {
    var ref = await SharedPreferences.getInstance();
    return ref.setString(ADS_ID_GOOGLE,s);
  }

  static Future<bool> saveTokenFirebaseMobile(String s) async {
    var ref = await SharedPreferences.getInstance();
    return ref.setString(T0KEN_FIREBASE_MOBILE,s);
  }

  static Future<String?> getNIKUser() async {
    var ref = await SharedPreferences.getInstance();
    return ref.getString(PROFILE_NIK);
  }

  static Future<Map<String, dynamic>> getInfoDevicesAndroid() async {
    var ref = await SharedPreferences.getInstance();
    String? encodedMap = ref.getString(INFO_DEVICES_ANDROID);
    Map<String,dynamic> decodedMap = json.decode(encodedMap!);
    return decodedMap;
  }

  static Future<Map<String, dynamic>> getInfoDevicesIOS() async {
    var ref = await SharedPreferences.getInstance();
    String? encodedMap = ref.getString(INFO_DEVICES_IOS);
    Map<String,dynamic> decodedMap = json.decode(encodedMap!);
    return decodedMap;
  }

  static Future<String?> getAdsIDGoogle() async {
    var ref = await SharedPreferences.getInstance();
    return ref.getString(ADS_ID_GOOGLE);
  }

  static Future<String?> getTokenFirebaseMobile() async {
    var ref = await SharedPreferences.getInstance();
    return ref.getString(T0KEN_FIREBASE_MOBILE);
  }

  static Future<bool> deleteUserNIK() async {
    var ref = await SharedPreferences.getInstance();
    return ref.remove(PROFILE_NIK);
  }

  static Future<bool> deleteAdsIDGoogle(String s) async {
    var ref = await SharedPreferences.getInstance();
    return ref.remove(ADS_ID_GOOGLE);
  }

  static Future<bool> deleteTokenFirebaseMobile(String s) async {
    var ref = await SharedPreferences.getInstance();
    return ref.remove(T0KEN_FIREBASE_MOBILE);
  }

}