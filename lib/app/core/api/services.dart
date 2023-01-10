import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response, FormData;
import 'package:mysleep/app/constants/api.dart';
import 'package:mysleep/app/constants/preference_key.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum Method { post, get }

class RestClient extends GetxService {
  final dio = Dio();

  Future<dynamic> request(
      String url, Method method, Map<String, dynamic>? params) async {
    Response response;
    final pref = await SharedPreferences.getInstance();
    print("token : " + pref.getString(PreferenceKey.token).toString());
    print(params);
    try {
      if (method == Method.post) {
        response = await dio.post(url,
            options: Options(
                maxRedirects: 5,
                sendTimeout: 30000,
                receiveTimeout: 30000,
                headers: {
                  "Content-Type": "multipart/form-data",
                  "x-token": pref.getString(PreferenceKey.token) ?? '',
                  "x-api-key": ApiConstants.apiKey,
                }),
            data: FormData.fromMap(params!));
      } else {
        response = await dio.get(url,
            options: Options(
                maxRedirects: 5,
                sendTimeout: 30000,
                receiveTimeout: 30000,
                headers: {
                  'Content-Type': 'application/json',
                  "x-token": pref.getString(PreferenceKey.token) ?? '',
                  "x-api-key": ApiConstants.apiKey,
                }),
            queryParameters: params);
      }
      print(response.statusCode);

      if (response.statusCode == 200 || response.statusCode == 201) {
        // log(response.data);
        return response.data;
      } else if (response.statusCode == 500) {
        // log(response.data);
        throw Exception("Server Error");
      } else if (response.statusCode == 406) {
        // log(response.data);
        return response.data;
      } else {
        // log(response.data);
        throw Exception("Something Went Wrong");
      }
    } catch (e) {
      throw Exception("Something Went Wrong : " + e.toString());
    }
  }
}
