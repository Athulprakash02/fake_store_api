

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:fake_store_api/constants/app_strings.dart';
import 'package:fake_store_api/data/network/service/app_url.dart';

class ApiService {

  late final Dio _dio;


  ApiService() {
    BaseOptions options = BaseOptions(
      baseUrl: AppUrl.baseUrl , // Default to AppUrl.baseUrl
      connectTimeout: Duration(milliseconds:AppUrl.connectionTimeout),
      receiveTimeout: Duration(milliseconds:AppUrl.receiveTimeout),
      responseType: ResponseType.json,
    );

    _dio = Dio(options)..interceptors.add(LogInterceptor());
  }


  // dio instance


  // Internet connectivity check
  static Future<bool> isInternetConnected() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }

  // GET request
  Future<Response> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    bool isConnected = await isInternetConnected();
    if (!isConnected) {
      throw DioException(
        requestOptions: RequestOptions(path: url),
        error: AppStrings.noInternetCOnnection,
      );
    }

    try {
      final Response response = await _dio.get(
        url,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // POST request
  Future<Response> post(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    bool isConnected = await isInternetConnected();
    if (!isConnected) {
      throw DioException(
        requestOptions: RequestOptions(path: url),
        error:AppStrings.noInternetCOnnection,
      );
    }
    try {
      final Response response = await _dio.post(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,

        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // PUT request
  Future<Response> put(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    bool isConnected = await isInternetConnected();
    if (!isConnected) {
      throw DioException(
        requestOptions: RequestOptions(path: url),
        error: AppStrings.noInternetCOnnection,
      );
    }
    try {
      final Response response = await _dio.put(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  //PATCH request
  Future<Response> patch(
      String url, {
        dynamic data,
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceiveProgress,
      }) async {
    bool isConnected = await isInternetConnected();
    if (!isConnected) {
      throw DioException(
        requestOptions: RequestOptions(path: url),
        error: AppStrings.noInternetCOnnection,
      );
    }
    try {
      final Response response = await _dio.patch(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // DELETE request
  Future<Response> delete(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    bool isConnected = await isInternetConnected();
    if (!isConnected) {
      throw DioException(
        requestOptions: RequestOptions(path: url),
        error:AppStrings.noInternetCOnnection,
      );
    }
    try {
      final Response response = await _dio.delete(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

}
