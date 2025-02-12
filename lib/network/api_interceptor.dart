import 'package:dio/dio.dart';


class AppInterceptors extends Interceptor {
  final Dio dio;

  AppInterceptors(this.dio);


  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler){
    Map<String, dynamic> headers = {
      "Content-Type": "application/x-www-form-urlencoded"
    };
    headers.addAll(
      {
        'Authorization': 'Bearer',
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      },
    );
    options.headers.addAll(headers);
    super.onRequest(options, handler);
  }
}


  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.type case DioException.connectionTimeout || DioException.sendTimeout || DioException.receiveTimeout) {
      throw DeadlineExceededException(err.requestOptions);
    } else if (err.type case DioException.badResponse) {
      switch (err.response?.statusCode) {
        case 400:
          throw BadRequestException(err.requestOptions);
        case 401:
          throw UnauthorizedException(err.requestOptions);
        case 404:
          throw NotFoundException(err.requestOptions);
        case 409:
          throw ConflictException(err.requestOptions);
        case 500:
          throw InternalServerErrorException(err.requestOptions);
      }

    } else if (err.type case DioException.requestCancelled) {

    } else if (err.type case DioException.connectionError) {
      throw NoInternetConnectionException(err.requestOptions);
    } else if (err.type case DioExceptionType.connectionTimeout) {
      throw DioExceptionType.connectionTimeout;
    }

    return handler.next(err);
  }

class BadRequestException extends DioException {
  BadRequestException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Invalid request';
  }
}

class InternalServerErrorException extends DioException {
  InternalServerErrorException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Unknown error occurred, please try again later.';
  }
}

class ConflictException extends DioException {
  ConflictException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Conflict occurred';
  }
}

class UnauthorizedException extends DioException {
  UnauthorizedException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Access denied';
  }
}

class NotFoundException extends DioException {
  NotFoundException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'The requested information could not be found';
  }
}

class NoInternetConnectionException extends DioException {
  NoInternetConnectionException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'No internet connection detected, please try again.';
  }
}

class DeadlineExceededException extends DioException {
  DeadlineExceededException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'The connection has timed out, please try again.';
  }
}