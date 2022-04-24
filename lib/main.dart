import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shopping/view/home/home_screen.dart';
import 'package:online_shopping/view/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      //home: const MyHomePage(title: 'Flutter Demo Home Page'),
      getPages: [
        GetPage(name: '/', page: ()=>const SplashScreen()),
        GetPage(name: HomeScreen.routeName, page: ()=>HomeScreen()),
      ],
    );
  }
}

