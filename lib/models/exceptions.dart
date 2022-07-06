import 'package:auth_ui/models/failure.dart';
import 'package:dio/dio.dart';

class UserDefinedException extends Failure {
  final String _title;
  final String _message;

  UserDefinedException(this._title, this._message);

  @override
  String get message => _message;

  @override
  String get title => _title;
}

/// 400
class BadRequestException extends DioError with Failure {
  BadRequestException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'title: $title message: $message';
  }

  @override
  String get message => "Invalid request";

  @override
  String get title => "Network error";
}

/// 500
class InternalServerErrorException extends DioError with Failure {
  InternalServerErrorException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'title: $title message: $message';
  }

  @override
  String get message => "Unknown error occurred, please try again later.";

  @override
  String get title => "Server error";
}

/// 409
class ConflictException extends DioError with Failure {
  ConflictException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'title: $title message: $message';
  }

  @override
  String get message => "Conflict occurred.";

  @override
  String get title => "Network error";
}

/// 401
class UnauthorizedException extends DioError with Failure {
  UnauthorizedException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'title: $title message: $message';
  }

  @override
  String get message => "Access denied";

  @override
  String get title => "Network error";
}

/// 404
class NotFoundException extends DioError with Failure {
  NotFoundException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'title: $title message: $message';
  }

  @override
  String get message => "Not Found, please try again.";

  @override
  String get title => "Network error";
}

/// No Internet
class NoInternetConnectionException extends DioError with Failure {
  NoInternetConnectionException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'title: $title message: $message';
  }

  @override
  String get message => "No internet connection, please try again.";

  @override
  String get title => "Network error";
}

/// Timeout
class DeadlineExceededException extends DioError with Failure {
  DeadlineExceededException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'title: $title message: $message';
  }

  @override
  String get message => "The connection has timed out, please try again.";

  @override
  String get title => "Network error";
}

@override
String toString() {
  return 'The connection has timed out, please try again.';
}

/// errors sent back by the server in json
class ServerCommunicationException extends DioError with Failure {
  ServerCommunicationException(this.r)
      : super(requestOptions: r!.requestOptions);

  /// sustained so that the data sent by the server can be gotten to construct message
  final Response? r;

  @override
  String toString() {
    return 'title: $title message: $message';
  }

  @override
  String get message {
    print(r?.data);
    return getMessagefromServer(r?.data ?? {"message": "Server Error"});
  }
  // eddietonsagie@gmail.com

  @override
  String get title => "Network error";
}
// austingodwin18@gmail.com