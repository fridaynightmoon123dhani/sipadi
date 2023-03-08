class UrlHelper {
// ignore: non_constant_identifier_names
  static String baseAPI = 'http://10.0.2.2:2801/';
  static String tokenId = "";
  static String alert = "";

  //#region Auth Routes
  static String adminRoutes = baseAPI + "api/v1/admin/auth";
  static String adminRegister = adminRoutes + "/register";
  static String adminLogin = adminRoutes + "/login";
  //#endregion
}