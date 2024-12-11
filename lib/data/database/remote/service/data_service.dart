import 'package:flutter/foundation.dart';
import 'package:lap_english/data/caching/cache_manager.dart';
import '../api/api.dart';
import 'package:dio/dio.dart';

abstract class ApiService<T> {
  final cacheManager = CacheManager();
  final dio = Dio(
    BaseOptions(
      validateStatus: (status) {
        return status != null && [200, 400, 403, 404, 409, 500].contains(status);
      },
    ),
  );

  Future<T?> success200(Response response);
  Future<dynamic> fail400(Response response) async {
    if (kDebugMode) {
      print('Error 400: ${response.data}');
    }
    return response.data;
  }

  Future<dynamic> fail403(Response response) async {
    if (kDebugMode) {
      print('Error 403: ${response.data}');
    }
    return response.data;
  }

  Future<dynamic> fail404(Response response) async {
    if (kDebugMode) {
      print('Error 404: ${response.data}');
    }
    return response.data;
  }

  Future<dynamic> fail409(Response response) async {
    if (kDebugMode) {
      print('Error 409: ${response.data}');
    }
    return response.data;
  }

  Future<dynamic> fail500(Response response) async {
    if (kDebugMode) {
      print('Error 500: ${response.data}');
    }
    return response.data;
  }

  Future<dynamic> request({required String api, Map<String, dynamic>? datas, required RequestType requestType}) async {
    String token = 'Bearer ${cacheManager.getToken().accessToken}';
    String urlRequest = '${ApiBase.data}$api';
    try {
      final Response response;

      switch(requestType) {
        case RequestType.get:
          response = await dio.get(
            urlRequest,
            queryParameters: datas,
            options: Options(
              headers: {
                'Authorization': token,
              },
            ),
          );
          break;
        case RequestType.post:
          response = await dio.post(
            urlRequest,
            data: datas,
            options: Options(
              headers: {
                'Authorization': token,
              },
            ),
          );
          break;
        case RequestType.put:
          response = await dio.put(
            urlRequest,
            data: datas,
            options: Options(
              headers: {
                'Authorization': token,
              },
            ),
          );
          break;
        case RequestType.delete:
          response = await dio.delete(
            urlRequest,
            data: datas,
            options: Options(
              headers: {
                'Authorization': token,
              },
            ),
          );
          break;
      }

      if (response.statusCode == 200) {
        return success200(response);
      }
      else if(response.statusCode == 400) {
        return fail400(response);
      }
      else if(response.statusCode == 403) {
        return fail403(response);
      }
      else if(response.statusCode == 404) {
        return fail404(response);
      }
      else if(response.statusCode == 409) {
        return fail409(response);
      }
      else if(response.statusCode == 500) {
        return fail500(response);
      }
      else {
        throw Exception('Error in GET request ad: ${response.statusCode}');
      }
    } catch (error) {
      if (kDebugMode) {
        print('Error in GET request: $error');
      }
      return null;
    }
  }
}

enum RequestType { get, post, put, delete }
