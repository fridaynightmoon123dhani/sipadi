part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const HOME = _Paths.HOME;
  static const LOGIN = _Paths.LOGIN;
  static const SPLASH = _Paths.SPLASH;
  static const FORGOTPASSWORD = _Paths.FORGOTPASSWORD;

}

abstract class _Paths {
  static const HOME = '/home';
  static const LOGIN = '/login';
  static const SPLASH = '/splash';
  static const FORGOTPASSWORD = '/forgot_password';
}