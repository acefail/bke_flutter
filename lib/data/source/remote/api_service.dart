import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';

import '../../models/data_exception.dart';

// API Request Model -----------------------------------------------------------
class APIService<T> {
  final String path;
  final Map<String, dynamic>? header;
  final Map<String, dynamic>? queryParams;
  final Map<String, dynamic>? body;

  T Function(Map<String, dynamic> response) parseResponse;

  APIService(this.path, this.parseResponse,
      {this.body, this.header, this.queryParams});
}

// API Client ------------------------------------------------------------------
class APIClient {
  late final Dio _dioClient;
  late final Connectivity _connectivity;

  APIClient() {
    final options = BaseOptions(
      receiveDataWhenStatusError: true,
      connectTimeout: 30000,
      receiveTimeout: 30000,
    );
    _dioClient = Dio(options);
    _connectivity = Connectivity();
  }

  /// HTTP GET
  Future<T> get<T>(APIService<T> resource) async {
    try {
      final headerOption = Options(headers: resource.header);
      final response = await _dioClient.get(
        resource.path,
        options: headerOption,
        queryParameters: resource.queryParams,
      );
      return resource.parseResponse(response.data);
    } on DioError catch (e) {
      switch (e.type) {
        case DioErrorType.receiveTimeout:
          throw RemoteException(
            errorMessage: 'Receive timeout',
            errorCode: RemoteException.receiveTimeout,
          );
        case DioErrorType.connectTimeout:
          throw RemoteException(
            errorMessage: 'Connect timeout',
            errorCode: RemoteException.connectTimeout,
          );
        case DioErrorType.sendTimeout:
          throw RemoteException(
            errorMessage: 'Send timeout',
            errorCode: RemoteException.sendTimeout,
          );
        case DioErrorType.response:
          throw RemoteException(
            errorMessage: 'Server error: ${e.response?.data}',
            errorCode: e.response?.statusCode ?? RemoteException.receiveTimeout,
          );
        case DioErrorType.cancel:
          throw RemoteException(
            errorMessage: 'Cancel request',
            errorCode: RemoteException.cancel,
          );

        default:
          final connectivityResult = await _connectivity.checkConnectivity();
          if (connectivityResult == ConnectivityResult.none) {
            throw RemoteException(
              errorMessage: 'No internet connection',
              errorCode: RemoteException.noInternet,
            );
          } else {
            throw RemoteException(
              errorMessage: 'Dio error unknown',
              errorCode: RemoteException.other,
            );
          }
      }
    } on SocketException catch (e) {
      throw RemoteException(
        errorMessage: 'Socket Exception: $e',
        errorCode: RemoteException.socket,
      );
    } catch (e) {
      throw RemoteException(
        errorMessage: 'Error while requesting: $e',
        errorCode: RemoteException.other,
      );
    }
  }

  /// HTTP POST
  Future<T> post<T>(APIService<T> resource) async {
    try {
      final headerOption = Options(headers: resource.header);
      final response = await _dioClient.post(resource.path,
          options: headerOption,
          queryParameters: resource.queryParams,
          data: resource.body);
      return resource.parseResponse(response.data);
    } on DioError catch (e) {
      switch (e.type) {
        case DioErrorType.receiveTimeout:
          throw RemoteException(
            errorMessage: 'Receive timeout',
            errorCode: RemoteException.receiveTimeout,
          );
        case DioErrorType.connectTimeout:
          throw RemoteException(
            errorMessage: 'Connect timeout',
            errorCode: RemoteException.connectTimeout,
          );
        case DioErrorType.sendTimeout:
          throw RemoteException(
            errorMessage: 'Send timeout',
            errorCode: RemoteException.sendTimeout,
          );
        case DioErrorType.response:
          throw RemoteException(
            errorMessage: 'Server error: ${e.response?.data}',
            errorCode: e.response?.statusCode ?? RemoteException.receiveTimeout,
          );
        case DioErrorType.cancel:
          throw RemoteException(
            errorMessage: 'Cancel request',
            errorCode: RemoteException.cancel,
          );
        default:
          throw RemoteException(
            errorMessage: 'Dio error unknown',
            errorCode: RemoteException.other,
          );
      }
    } on SocketException catch (e) {
      throw RemoteException(
        errorMessage: 'No internet connection',
        errorCode: RemoteException.socket,
      );
    } catch (e) {
      throw RemoteException(
        errorMessage: 'Error while requesting: $e',
        errorCode: RemoteException.other,
      );
    }
  }
}
