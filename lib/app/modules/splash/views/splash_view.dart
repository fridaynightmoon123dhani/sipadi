import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  @override
  final SplashController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: const Center(
        child: Text(
          'Test',
          style: TextStyle(
              fontSize: 40, color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
    );

    /*
    return Scaffold(
      backgroundColor: AppColor.primaryExtraSoft,
      body: GetBuilder<SplashController>(
        init: SplashController(),
        builder: (controller) {
          return Stack(
            fit: StackFit.expand,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/images/logo.webp',
                    width: controller.animation.value * 200,
                    height: controller.animation.value * 200,
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  Text(
                    "----",
                    style: TextStyle(
                        fontSize: MySize.size28, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    ".............",
                    style: TextStyle(
                        fontSize: MySize.size28, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      SizedBox(
                        // height: 15.0,
                        child: Text("Powered By\n"),
                      ),
                      SizedBox(
                        height: 70.0,
                        child: Image.asset(
                          "assets/images/logo.webp",
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.1,
              ),
            ],
          );
        },
      ),
    );
     */
  }
}
