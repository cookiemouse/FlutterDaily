import 'package:http/http.dart' as http;
import 'dart:convert';

class NetUtil {
  static void get(String url, Function callback, {Function errorCallback}) async {
    final response = await http.get(url);
    final responseJson = json.decode(response.body);
    print('responseJson--> $responseJson');
    print('\n');
    print('=============================');
    try {
      print('step -- 1');
      if (null != callback) {
        print('step -- 2');
        callback(responseJson);
      } else {
        throw new NullThrownError();
      }
    } catch (exception) {
      print('step -- 3');
      if (null != errorCallback) {
        errorCallback(exception);
      }
    }
  }
}