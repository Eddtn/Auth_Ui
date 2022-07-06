// import 'dart:convert';

// import 'package:http/http.dart' as http;

// class AuthService {
//   Future<bool> emailVerification(String email) async {
//     // _userEmail = email;

//     final response = await http.post(
//       Uri.parse(
//           'https://kudel-exp-api.herokuapp.com/api/auth/send/verification/email/'),
//       body: json.encode({
//         "email": email,
//       }),
//     );
//     return true;
//   }
// }

import 'dart:convert';
import 'package:auth_ui/constants/apiroute.dart';
import 'package:auth_ui/router/route.dart';
import 'package:auth_ui/services/navigation_service.dart';
import 'package:auth_ui/utilis/network_client.dart';
import 'package:http/http.dart' as http;
import 'package:auth_ui/models/failure.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/auth_user_model.dart';

class AuthService {
  static final AuthService _instance = AuthService();
  final NetworkClient _networkClient = NetworkClient();

  static AuthService get instance => _instance;
  AuthUserModel? _currentUser;
  AuthUserModel? get currentUser => _currentUser;
  String? _userEmail;
  String? _otp;

  String get userEmail => _userEmail ?? "";

  Future<bool> emailVerification(String email) async {
    try {
      _userEmail = email;

      final response = await _networkClient.post(
        ApiRoute.emailVerification,
        body: json.encode({
          "email": email,
        }),
      );
      return true;
    } on Failure {
      return false;
      // rethrow;
    }
  }

  // Future<bool> forgotPasswordEmailVerification(String email) async {
  //   _userEmail = email;
  //   http.Response response = await http.post(
  //     Uri.parse(
  //         "http://kudel-reamp.herokuapp.com/api/auth/recover/password/trigger/"),
  //     body: json.encode({
  //       "email": email,
  //     }),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //   );

  //   print("your email variable is == $_userEmail");
  //   print(response.statusCode);
  //   return response.statusCode == 204;
  // }

  // Future<bool> resetPasswordEmailVerification({
  //   required String otp,
  //   required String password,
  // }) async {
  //   http.Response response = await http.post(
  //     Uri.parse(
  //         "http://kudel-reamp.herokuapp.com/api/auth/recover/password/reset/"),
  //     body: json.encode({
  //       "email": _userEmail,
  //       "pin": otp,
  //       "new_password": password,
  //     }),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //   );

  //   print(response.statusCode);
  //   print(response.body);
  //   return response.statusCode == 204;
  // }

  Future<bool> sendOTPVerification(String otp) async {
    _otp = otp;
    http.Response response = await http.post(
      Uri.parse("https://kudel-exp-api.herokuapp.com/api/auth/verify/email/"),
      body: json.encode({
        "email": _userEmail,
        "pin": otp,
      }),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    return response.statusCode == 200;
    print(response.body);

    // response.
  }

  // Future<bool> login({
  //   required String email,
  //   required String password,
  // }) async {
  //   http.Response response = await http.post(
  //     Uri.parse("http://kudel-reamp.herokuapp.com/api/auth/token/login/"),
  //     body: json.encode({
  //       "email": email,
  //       "password": password,
  //     }),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //   );
  //   populateUser(jsonDecode(response.body));
  //   return response.statusCode == 200;
  //   // print(response.body);

  //   // response.
  // }

  Future<bool> signUp({
    required String firstname,
    required String lastname,
    required String phone,
    required String password,
  }) async {
    try {
      var uri = Uri.parse(
          "https://kudel-exp-api.herokuapp.com/api/auth/users/?as=Regular");
      var request = http.MultipartRequest('POST', uri)
        ..fields.addAll(
          {
            "email": _userEmail!,
            "pin": _otp!,
            "last_name": lastname,
            "first_name": firstname,
            "password": password,
            "phone": phone,
          },
        );
      http.StreamedResponse streamResponse = await request.send();
      final http.Response response =
          await http.Response.fromStream(streamResponse);

      populateUser(jsonDecode(response.body));
      return response.statusCode == 200;
      // print(response.body);
    } catch (e) {
      return false;
    }
    // response;
  }

// =======================================================
// ===========Saving and getting locally==================
// ========================================================

  // logout() async {
  //   //clear local storage
  //   SharedPreferences _sharedPreference = await SharedPreferences.getInstance();
  //   _sharedPreference.clear();
  //   // clear logged in user data
  //   _currentUser = null;
  //   //go to login view
  //   NavigationService.instance.navigateTo(loginRoute);
  // }

  Future<bool> isLoggedin() async {
    _currentUser = await _getUserLocally();
    return _currentUser != null;
  }

  populateUser(Map<String, dynamic> json) async {
    _currentUser = AuthUserModel.fromMap(json);
    await _saveUserLocally();
  }

  /// save user data locally
  _saveUserLocally() async {
    SharedPreferences _sharedPreference = await SharedPreferences.getInstance();
    if (_currentUser != null) {
      _sharedPreference.setString("user", jsonEncode(_currentUser!.toMap()));
    }
  }

  // //get user data from local storage
  Future<AuthUserModel?> _getUserLocally() async {
    //get data locally
    SharedPreferences _sharedPreference = await SharedPreferences.getInstance();

    String? userData = _sharedPreference.getString("user");
    //check if user data exist
    // return null if no
    // return user data if found
    if (userData == null) return null;
    return AuthUserModel.fromMap(jsonDecode(userData));
  }
}
