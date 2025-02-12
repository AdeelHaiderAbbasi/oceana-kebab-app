
import 'package:dio/dio.dart';

import 'api_interceptor.dart';


class Api {
  final dio = createDio();
  final tokenDio = Dio(BaseOptions(baseUrl: "https://foodbackend-crm7.vercel.app/"));

  Api._internal();

  static final _singleton = Api._internal();

  factory Api() => _singleton;

  static Dio createDio() {
    var dio = Dio(BaseOptions(
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded', // Important!
        },
      baseUrl: "https://foodbackend-crm7.vercel.app/",
      receiveTimeout: const Duration(seconds: 30), // 15 seconds
      connectTimeout: const Duration(seconds: 15),
      sendTimeout: const Duration(seconds: 15),
    ));

    dio.interceptors.addAll({
      AppInterceptors(dio),
    });
    return dio;
  }
}

