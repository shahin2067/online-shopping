
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shopping/view/home/home_screen.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    goHomeScreen();
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                height: 200,
                width: 200,
                color: Colors.amber,
              ),
            ),
            const SizedBox(height: 10,),
            const Center(
              child: SizedBox(
                height: 40,
                width: 40,
                child: CircularProgressIndicator(
                  color: Colors.amber,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void goHomeScreen() async{
    await Future.delayed(const Duration(seconds: 3));
    //Get.offNamedUntil(HomeScreen.routeName, (route) => false);
    //Get.offAll(HomeScreen.routeName);
    //Get.toNamed(HomeScreen.routeName);
    Get.off(HomeScreen());
  }
}
