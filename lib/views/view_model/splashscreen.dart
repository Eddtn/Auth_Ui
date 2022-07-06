import 'package:auth_ui/baseview_model.dart';
import 'package:auth_ui/router/route.dart';
import 'package:auth_ui/services/auth_service.dart';
import 'package:auth_ui/services/navigation_service.dart';

class SplashScreenViewModel extends BaseViewModel {
  final AuthService _authService = AuthService.instance;

  checkLoginStatus({Function? callBack}) async {
    // await Future.delayed(Duration(seconds: 2));
    bool isLoggedIn = await _authService.isLoggedin();
    //
    if (isLoggedIn) {
      NavigationService.instance.navigateTo(homeRoute);
    } else {
      // if there is a call back function
      // execute it
      if (callBack != null) callBack();
    }
  }
}
