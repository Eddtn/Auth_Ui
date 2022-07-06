import 'package:dio/dio.dart';

class AppInterceptors extends Interceptor {
  // final _log = appLogger(AppInterceptors);
  final Dio dio;

  AppInterceptors(this.dio);

  @override
  Future<dynamic> onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    // checkStatusCode(response.requestOptions, response);

    return handler.next(response);
  }

  @override
  Future onError(
    DioError err,
    ErrorInterceptorHandler handler,
  ) async {
    switch (err.type) {
      case DioErrorType.connectTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        // reasign err variable
        // err = DeadlineExceededException(err.requestOptions);
        break;
      case DioErrorType.response:
        try {
          // checkStatusCode(err.requestOptions, err.response);
        } on DioError catch (failure) {
          // reasign err variable
          err = failure;
        }

        break;
      case DioErrorType.cancel:
        break;
      case DioErrorType.other:
      // _log.e(err.message);
      // err = NoInternetConnectionException(err.requestOptions);
    }
    //continue
    return handler.next(err);
  }

  // void checkStatusCode(RequestOptions requestOptions, Response? response) {
  //   try {
  //     switch (response?.statusCode) {
  //       case 200:
  //       case 204:
  //       case 201:
  //         break;
  //       case 400:
  //         throw BadRequestException(requestOptions);
  //       case 401:
  //         throw UnauthorizedException(requestOptions);
  //       case 404:
  //         throw NotFoundException(requestOptions);
  //       case 409:
  //         throw ConflictException(requestOptions);
  //       case 500:
  //         throw InternalServerErrorException(requestOptions);
  //       default:
  //         _log.e(response?.data);
  //         _log.e(response?.statusCode);
  //         throw ServerCommunicationException(response);
  //     }
  //   } on Failure {
  //     rethrow;
  //   }
}
// }
