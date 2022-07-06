import 'dart:async';
import 'dart:io';

import 'package:auth_ui/models/failure.dart';
import 'package:auth_ui/services/auth_service.dart';
import 'package:dio/dio.dart';

import '../constants/apiroute.dart';
import 'network_interceptor.dart';

// Oops something went wrong
class NetworkClient {
  NetworkClient._internal();

  static final _singleton = NetworkClient._internal();

  factory NetworkClient() => _singleton;

  final Dio _dio = createDio();
// ======================================================
//================== Dio Initialization =================
//=======================================================

  static Dio createDio() {
    var dio = Dio(BaseOptions(
      baseUrl: BaseUrl,
      receiveTimeout: 30000, // 15 seconds
      connectTimeout: 30000,
      sendTimeout: 30000,
    ));

    dio.interceptors.addAll({
      AppInterceptors(dio),
    });
    return dio;
  }

// ======================================================
//======================== Get ==========================
//=======================================================
  ///get request
  Future<T> get<T>(
    /// the api route path without the base url
    String uri, {
    Map<String, dynamic> queryParameters = const {},
    // Options options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _authenticationService = AuthService.instance;

    try {
      Response response = await _dio.get(
        uri,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
        options: Options(
          headers: {
            "Authorization":
                "Bearer ${_authenticationService.currentUser?.token}",
          },
        ),
      );
      // checkRequest(response);
      return response.data;
    } on Failure {
      rethrow;
    }
  }

// ======================================================
//======================== POST ==========================
//=======================================================
  ///Post request
  Future<dynamic> post(
    /// the api route without the base url
    String uri, {

    ///this are query parameters that would
    /// be attached to the url
    /// [e.g]=>{"a":"yes"}
    /// she.com/getPeople?a=yes
    Map<String, dynamic> queryParameters = const {},
    Object? body,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _authenticationService = AuthService.instance;
    try {
      Response response = await _dio.post(
        uri,
        queryParameters: queryParameters,
        data: body,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
        options: Options(
          headers: {
            "Authorization": _authenticationService.currentUser?.token ?? "",
          },
        ),
      );
      // checkRequest(response);
      return response.data;
    } on Failure {
      rethrow;
    }
  }

// ======================================================
//======================== PUT ==========================
//=======================================================
  ///Put Request
  Future<T> put<T>(
    /// the api route without the base url
    String uri, {

    ///this are query parameters that would
    /// be attached to the url
    /// [e.g]=>{"a":"yes"}
    /// she.com/getPeople?a=yes
    Map<String, dynamic> queryParameters = const {},
    Object body = const {},
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _authenticationService = AuthService.instance;
    try {
      Response response = await _dio.put(
        uri,
        queryParameters: queryParameters,
        data: body,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
        options: Options(
          headers: {
            "Authorization": _authenticationService.currentUser?.token ?? "",
          },
        ),
      );
      // checkRequest(response);
      return response.data;
    } on Failure {
      rethrow;
    }
  }

// ======================================================
//====================== Form data ======================
//=======================================================
  ///Form Data

  Future<dynamic> sendFormData(
    String requestType, {

    /// route path without baseurl
    required String uri,

    ///this are query parameters that would
    /// be attached to the url
    /// [e.g]=>{"a":"yes"}
    /// she.com/getPeople?a=yes
    Map<String, dynamic> queryParameters = const {},

    /// data to be sent
    /// [must not add file]
    required Map<String, dynamic> body,

    /// Files to be sent
    /// [Files only]
    Map<String, File> images = const {},
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final _authenticationService = AuthService.instance;

      Map<String, MultipartFile> multipartImages = {};

      images.forEach(
        (key, value) async {
          multipartImages[key] = await MultipartFile.fromFile(
            value.path,
            // filename: "upload.jpeg",
          );
        },
      );

      FormData formData = FormData.fromMap({
        ...body,
        ...multipartImages,
      });

      Response response = await _dio.post(
        uri,
        queryParameters: queryParameters,
        data: formData,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
        options: Options(
          headers: {
            "Authorization": _authenticationService.currentUser?.token ?? "",
          },
        ),
      );

      // checkRequest(response);
      // return server response
      return response.data;
    } on Failure {
      rethrow;
    }
  }

  // checkRequest(Response response) {
  //   switch (response.statusCode) {
  //     case 200:
  //     case 201:
  //       return;
  //     case 401:
  //       throw Failure(
  //         title: "Unauthorized",
  //         message: "You do not have access to this functionality",
  //         status: FailureStatus.ServerCommunication,
  //       );
  //     case 404:
  //       throw Failure(
  //         title: "Not Found",
  //         message: response.data["message"],
  //         status: FailureStatus.NotFound,
  //       );

  //     default:
  //       // print(response.body);
  //       Map result = response.data;
  //       // if(result.)
  //       throw Failure.fromServer(result);
  //   }
  // }
}
