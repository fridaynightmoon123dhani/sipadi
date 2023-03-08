import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/controllers/page_index_controller.dart';
import 'app/routes/app_pages.dart';

theme() {
}
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Get.put(PageIndexController(), permanent: true);

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await GetStorage.init();
  HttpOverrides.global = MyHttpOverrides();

  runApp(const MyApp());
}


class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  const MyApp({Key? key}) : super(key: key);

  final String title = "";
  // final firebaseMessaging = FirebaseMessaging();

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Device Information
  String? deviceName = "";
  String? deviceVersion = "";
  String? deviceIdentifier = "unknown";
  String? deviceBrand = "";
  String? deviceModel = "";

  var box = GetStorage();

  String initial = Routes.LOGIN;
  String result = "Hey there !";

  @override
  void initState() {
    super.initState();
    initialRoute();

  }

  // void initDeviceInfo() async {
  //   final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  //
  //   bool isIOS = Theme.of(context).platform == TargetPlatform.iOS;
  //   bool isAndroid = Theme.of(context).platform == TargetPlatform.android;
  //
  //   if (isAndroid) {
  //     var build = await deviceInfoPlugin.androidInfo;
  //     deviceName = build.device!;
  //     deviceVersion = build.version.sdkInt.toString();
  //     deviceIdentifier = build.androidId; //UUID for Android
  //     deviceBrand = build.brand;
  //     deviceModel = build.model;
  //   } else if (isIOS) {
  //     var data = await deviceInfoPlugin.iosInfo;
  //     deviceName = data.name;
  //     deviceVersion = data.systemVersion;
  //     deviceBrand = "Iphone";
  //     deviceModel = data.model;
  //     deviceIdentifier = data.identifierForVendor; //UUID for iOS
  //   }
  //
  //   box.write('deviceBrand', deviceBrand!);
  //   box.write('deviceModel', deviceModel!);
  //   box.write('deviceVersion', deviceVersion!);
  //
  //   setState(() {
  //     deviceBrand = box.read<String>('deviceBrand');
  //     deviceVersion = box.read<String>('deviceVersion');
  //   });
  // }

  String initialRoute() {
    var box = GetStorage();
    initial = box.read('token') == null ? Routes.HOME: Routes.HOME;
    return initial;
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Sistem Informasi Pemerintahan Desa',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'inter',
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: initial,
      getPages: AppPages.routes,
    );
  }
}