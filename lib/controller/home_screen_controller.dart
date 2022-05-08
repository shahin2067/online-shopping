import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:online_shopping/models/banner/BannerModel.dart';
import 'package:online_shopping/util/urls.dart';
import 'package:connectivity_plus/connectivity_plus.dart';


class HomeScreenController extends GetxController{
  var sliderCurrentPosition = 0.obs;
  var isLoading=false.obs;
  
  RxObjectMixin<BannerModel> bannerData = BannerModel().obs;

  var bannerItem = [
    'https://vendor.eshopweb.store/uploads/media/2021/new_Slider-2.jpg',
    'https://vendor.eshopweb.store/uploads/media/2021/Winter_Slider-min.jpg',
    'https://vendor.eshopweb.store/uploads/media/2022/new_Slider-3-min.jpg'
  ];

  @override
  void onInit() {
    fetchBannerData();
    super.onInit();
  }


  fetchBannerData() async{
    Dio dio = Dio(BaseOptions(
        baseUrl: 'https://6ammart-admin.6amtech.com',
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'zoneId': '1',
          'moduleId': '1',
          'X-localization': 'en',
          'Authorization': 'Bearer null'
        }
    ));

    try{
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.none) {
        EasyLoading.showToast('No Internet Connection');
        print('No Internet Connection');
      } else {
        isLoading.value=true;
        print('Internet Connected..');
        EasyLoading.show(status: 'Loading...');
        var response = await dio.get('/api/v1/banners');

        if(response.statusCode == 200) {
          EasyLoading.showToast('Data loaded successfully', duration: const Duration(seconds: 2), toastPosition:EasyLoadingToastPosition.bottom );
          print('HTTP Mehtods: ${response.requestOptions.method} ');
          print('HTTP URL: ${response.requestOptions.baseUrl} ');
          print('HTTP Path: ${response.requestOptions.path} ');
          print('HTTP Status code: ${response.statusCode} Status Message: ${response.statusMessage}');
          //print(response.data);
          var jsonResponse = response.data;
          //print('jsonResponse: $jsonResponse');
          bannerData.value = BannerModel.fromJson(jsonResponse);
          //var data = jsonResponse['data'] as List;
          //print('Data: $data');
          // var list = data.map((e) => Data.fromJson(e));
          // userList.addAll(list);
          // //print('Shahin: ${list[2].data![0].email}');
          // print('Shahin: ${userList.length}');

        } else{
          print('Failed to load data');
        }
      }

    } catch(e){
      print('Error occurred: $e');
    } finally {
      isLoading.value=false;
      EasyLoading.dismiss();
    }

    // try{
    //   if (connectivityResult == ConnectivityResult.none) {
    //     print('No Internet Connection');
    //     EasyLoading.showToast('Check Your Internet Connection', duration: const Duration(seconds: 3));
    //   } else {
    //     var response = await dio.get(Urls.getBannerUrl);
    //
    //     if(response.statusCode == 200){
    //       print('Data');
    //       var bnnerData = response.data;
    //       print(bnnerData);
    //       EasyLoading.showToast('Data Loading Success', duration: const Duration(seconds: 2), toastPosition:EasyLoadingToastPosition.bottom );
    //       print('HTTP Mehtod: ${response.requestOptions.method} ');
    //       print('HTTP URL: ${response.requestOptions.baseUrl} ');
    //       print('HTTP Path: ${response.requestOptions.path} ');
    //       print('HTTP Status code: ${response.statusCode} Status Message: ${response.statusMessage}');
    //
    //     } else{
    //       print('Failed to Load Data');
    //     }
    //   }
    //
    // } catch(e){
    //   print('Error occurred: $e');
    //   EasyLoading.showError('Failed to Load data');
    // }finally{
    //
    // }



  }

  // fetchBannerData() async{
  //   Dio dio = Dio(BaseOptions(
  //     baseUrl: Urls.baseUrl,
  //     headers: {
  //       'Content-Type': 'application/json; charset=UTF-8',
  //       'zoneId': '1',
  //       'moduleId': '1',
  //       'X-localization': 'en',
  //       'Authorization': 'Bearer null'
  //     }
  //   ));
  //
  //   print('Shahin');
  //   //var connectivityResult = await (Connectivity().checkConnectivity());
  //
  //   try{
  //     var connectivityResult = await (Connectivity().checkConnectivity());
  //     if (connectivityResult == ConnectivityResult.none) {
  //       EasyLoading.showToast('No Internet Connection');
  //       print('No Internet Connection');
  //     } else {
  //       print('Internet Connected..');
  //       EasyLoading.show(status: 'Loading...');
  //       var response = await dio.get('/api/v1/banners');
  //
  //       if(response.statusCode == 200) {
  //         EasyLoading.showToast('Data loaded successfully', duration: const Duration(seconds: 2), toastPosition:EasyLoadingToastPosition.bottom );
  //         print('HTTP Mehtods: ${response.requestOptions.method} ');
  //         print('HTTP URL: ${response.requestOptions.baseUrl} ');
  //         print('HTTP Path: ${response.requestOptions.path} ');
  //         print('HTTP Status code: ${response.statusCode} Status Message: ${response.statusMessage}');
  //         //print(response.data);
  //         var jsonResponse = response.data;
  //         //print('jsonResponse: $jsonResponse');
  //         var data = jsonResponse['data'] as List;
  //         //print('Data: $data');
  //         // var list = data.map((e) => Data.fromJson(e));
  //         // userList.addAll(list);
  //         // //print('Shahin: ${list[2].data![0].email}');
  //         // print('Shahin: ${userList.length}');
  //
  //       } else{
  //         print('Failed to load data');
  //       }
  //     }
  //
  //   } catch(e){
  //     print('Error occurred: $e');
  //   }
  //
  //   // try{
  //   //   if (connectivityResult == ConnectivityResult.none) {
  //   //     print('No Internet Connection');
  //   //     EasyLoading.showToast('Check Your Internet Connection', duration: const Duration(seconds: 3));
  //   //   } else {
  //   //     var response = await dio.get(Urls.getBannerUrl);
  //   //
  //   //     if(response.statusCode == 200){
  //   //       print('Data');
  //   //       var bnnerData = response.data;
  //   //       print(bnnerData);
  //   //       EasyLoading.showToast('Data Loading Success', duration: const Duration(seconds: 2), toastPosition:EasyLoadingToastPosition.bottom );
  //   //       print('HTTP Mehtod: ${response.requestOptions.method} ');
  //   //       print('HTTP URL: ${response.requestOptions.baseUrl} ');
  //   //       print('HTTP Path: ${response.requestOptions.path} ');
  //   //       print('HTTP Status code: ${response.statusCode} Status Message: ${response.statusMessage}');
  //   //
  //   //     } else{
  //   //       print('Failed to Load Data');
  //   //     }
  //   //   }
  //   //
  //   // } catch(e){
  //   //   print('Error occurred: $e');
  //   //   EasyLoading.showError('Failed to Load data');
  //   // }finally{
  //   //
  //   // }
  //
  //
  //
  // }

}