import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get_storage/get_storage.dart';

import '../../../controllers/page_index_controller.dart';
import '../../../libs/db_helper.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/connectivity_checker.dart';
import '../../../widgets/toast/custom_toast.dart';

class LoginController extends GetxController {
  var box = GetStorage();
  final pageIndexController = Get.find<PageIndexController>();

  RxBool isLoading = false.obs;
  RxBool obsecureText = true.obs;

  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();

  checkDefaultPassword() {
    if (passC.text == 'qwertyuiop') {
      Get.toNamed(Routes.LOGIN);
    } else {
      Get.offAllNamed(Routes.HOME);
      pageIndexController.changePage(0);
    }
  }

  void onInit() async {
    super.onInit();

    if (Get.currentRoute == Routes.LOGIN) {
      box.remove('token');
      box.erase();
    }
  }

  Future<void> signIn() async {
    var response;
    String username = 'timgue-hris';
    String password = 'timgue7agPsd';
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));

    if (emailC.text.isNotEmpty && passC.text.isNotEmpty) {
      isLoading.value = true;
      try {
        if (await ConnectivityChecker.checkConnection()) {
          Map data = {
            'email': emailC.text,
            'password': passC.text,
          };

          Map jsonResponse = {};
          response = await Dio().post(
            UrlHelper.adminLogin,
            data: data,
            options:
            Options(headers: <String, String>{'authorization': basicAuth}),
          );

          if (response.statusCode == 200) {
            jsonResponse = response.data;

            box.write("user_id", jsonResponse["data"]['id']);
            box.write("role", jsonResponse["data"]['role_data']['description']);
            box.write("token", jsonResponse["data"]['token']);

            isLoading.value = false;
            checkDefaultPassword();
            // Get.off(Home());
          } else if (response.statusCode == 302) {
            CustomToast.errorToast("Error", "Akun tidak ditemukan");
            isLoading.value = false;
          } else {
            CustomToast.errorToast("Error",
                "Error because : ${json.decode(response.data)['message']}");
            isLoading.value = false;
          }
        } else {
          CustomToast.errorToast("Error", "Mohon aktifkan paket data internet atau wifi");
          isLoading.value = false;
        }
      } on DioError catch (e) {
        // print(e);
        if (e.response?.statusCode == 401) {
          CustomToast.errorToast("Error", "Password anda salah");
          isLoading.value = false;
        } else if (e.response?.statusCode == 403) {
          CustomToast.errorToast("Error", "Akun anda tidak dapat di temukan");
          isLoading.value = false;
        } else {
          isLoading.value = false;
          print(UrlHelper.adminLogin);
          print(e.error);
          print(e.response?.statusMessage);

        }
      } catch (e) {
        CustomToast.errorToast("Error", "Error because : ${e.toString()}");
        isLoading.value = false;
      }
    } else {
      CustomToast.errorToast(
          "Error", "silahkan isi kolom nomor handphone dan password anda");
      isLoading.value = false;
    }
  }
}