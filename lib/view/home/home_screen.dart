import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shopping/controller/home_screen_controller.dart';
import 'package:online_shopping/util/urls.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home_screen';
  final HomeScreenController _controller=Get.put(HomeScreenController());


  @override
  Widget build(BuildContext context) {
    //print('image: ${_controller.bannerData.value.banners![1].image??''}');
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text('Home Screen'),
            floating: true,
            //pinned: true,
          ),
          SliverToBoxAdapter(
            child: _sliderWidget(context),
          ),
        ],
      ),
    );
  }


  Widget _sliderWidget(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: Stack(
        children: [
          Obx(()=>_controller.isLoading==true?Container(): CarouselSlider.builder(

            itemCount: _controller.bannerData.value.banners?.length??0,
            itemBuilder: (context, index, realIndex) => SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width/3,
              child: Image.network('${Urls.bannerImageUrl}${_controller.bannerData.value.banners![index].image??''}',fit: BoxFit.cover, ),
            ),

            options: CarouselOptions(
                enlargeCenterPage: true,
                height: MediaQuery.of(context).size.width/3,
                viewportFraction: 1,
                disableCenter: true,
                autoPlay: true,
                pauseAutoPlayOnTouch: true,
                onPageChanged: (index, reason) {
                  _controller.sliderCurrentPosition.value=index;

                  // setState(() {
                  //   sliderCurrentIndex = index;
                  // });

                  // print(index);
                  // print(reason);
                }
            ),

          )),
          Positioned(
              bottom: 10,
              left: (MediaQuery.of(context).size.width-25)/2,
              child: Obx(()=>_controller.isLoading==true?Container(): Row(
                children: _controller.bannerData.value.banners!.map((e) {
                  var currentIndex=_controller.bannerData.value.banners?.indexOf(e);
                  return Container(
                    margin: const EdgeInsets.only(left: 5),
                    height: 10,
                    width: 10,
                    decoration:  BoxDecoration(
                        color: _controller.sliderCurrentPosition.value==currentIndex?Colors.amber:Colors.black,
                        borderRadius: const BorderRadius.all(Radius.circular(10))

                    ),

                  );
                }).toList(),
              ))

          )
        ],
      ),
    );
  }

  Widget _shimmerSliderWidget(BuildContext context) {
    return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width/3,
      child: Shimmer.fromColors(
        baseColor: Colors.black,
        highlightColor: Colors.white,
        child: Container(
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(5)
          ),
        ),
      ),
            );

  }


}
