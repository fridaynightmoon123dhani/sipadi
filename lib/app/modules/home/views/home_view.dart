import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/get.dart';
import '../../../style/app_color.dart';
import '../../../widgets/bottom_sheets/custom_bottom_sheet.dart';
import '../controllers/home_controller.dart';


class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    bottomNavigationBar: CustomBottomNavigationBar(),
    extendBody: true,
    extendBodyBehindAppBar: true,
    body:
    ListView(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 36),
      children: [
        SizedBox(height: 5),
        //#region Section 1 - Welcome Back
        Container(
          margin: EdgeInsets.only(bottom: 16),
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              ClipOval(
                child: Container(
                  width: 42,
                  height: 42,
                  child:
                  Image.network(
                    "https://png.pngtree.com/png-clipart/20221006/original/pngtree-memperingati-isra-miraj-1444-h-tahun-2023-png-image_8660955.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 24),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Selamat Datang",
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColor.secondarySoft,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Nama User",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: 'poppins',
                    ),
                  ),
                  Text(
                    "Warga",//status usernya sebagai (warga, ketua Rt/perangkat desa sesuai di jabatan)
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontFamily: 'poppins',
                        color: AppColor.secondarySoft),


                  ),
                ],
              ),
            ],
          ),
        ),
        //#endregion




        const SizedBox(
          height: 10,
        ),


        const SizedBox(
          height: 50,
        ),



      ],
    ),
    );
  }
}