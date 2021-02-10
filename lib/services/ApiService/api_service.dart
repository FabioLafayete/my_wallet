import 'package:app_ewally/services/SharedPreferences/sp.dart';
import 'package:dio/dio.dart';
import 'interceptors.dart';
import 'package:app_ewally/.env.dart';

class ApiService {
  static getClient({bool noToken = false}) async {
    Dio client = Dio();

    String token = await Shared.getToken();

    client.lock();

    if (!noToken && token != null && token.isNotEmpty) {
      client.options.headers.addAll({'Authorization': 'Bearer $token'});
    }

    client.options.baseUrl = env['baseUrl'];
    client.interceptors.add(CustomInterceptors());
    client.options.connectTimeout = 5000;

    client.unlock();

    return client;
  }
}