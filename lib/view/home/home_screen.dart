import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shopping/controller/home_screen_controller.dart';
import 'package:online_shopping/view/home/widget/category_widget.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home_screen';
  final HomeScreenController _controller=Get.put(HomeScreenController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEBEAEF),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('Home Screen'),
            floating: true,
            //pinned: true,
          ),
          SliverToBoxAdapter(
            child: _sliderWidget(context),
          ),
          SliverToBoxAdapter(
            child: CategoryWidget(),
          ),


          // SliverToBoxAdapter(
          //   child: Container(
          //     height: 100,
          //     width: 200,
          //     color: Colors.red,
          //   ),
          // ),
          // SliverToBoxAdapter(
          //   child: Container(
          //     height: 100,
          //     width: 200,
          //     color: Colors.blue,
          //   ),
          // ),
          // SliverToBoxAdapter(
          //   child: Container(
          //     height: 100,
          //     width: 200,
          //     color: Colors.red,
          //   ),
          // ),
          // SliverToBoxAdapter(
          //   child: Container(
          //     height: 100,
          //     width: 200,
          //     color: Colors.blue,
          //   ),
          // ),
          // SliverToBoxAdapter(
          //   child: Container(
          //     height: 100,
          //     width: 200,
          //     color: Colors.red,
          //   ),
          // ),
          // SliverToBoxAdapter(
          //   child: Container(
          //     height: 100,
          //     width: 200,
          //     color: Colors.blue,
          //   ),
          // ),
          // SliverToBoxAdapter(
          //   child: Container(
          //     height: 100,
          //     width: 200,
          //     color: Colors.red,
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _sliderWidget(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: Stack(
        children: [
        CarouselSlider.builder(
            itemCount: _controller.bannerData.length,
            itemBuilder: (context, index, realIndex) =>
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width / 3,
                  child: Image.network(_controller.bannerData[index], fit: BoxFit.cover,),
                ),

            options: CarouselOptions(
                enlargeCenterPage: true,
                height: MediaQuery.of(context).size.width / 3,
                viewportFraction: 1,
                disableCenter: true,
                autoPlay: true,
                pauseAutoPlayOnTouch: true,
                onPageChanged: (index, reason) {
                  //_controller.sliderCurrentPosition.value=index;
                  _controller.sliderCurrentPosition.value = index;

                  // setState(() {
                  //   sliderCurrentPosition = index;
                  // });

                  // print(index);
                  // print(reason);
                }
            ),

          ),

          Positioned(
              bottom: 5,
              left: (MediaQuery.of(context).size.width - 25) / 2,
              child: Obx(()=>Row(
                children: _controller.bannerData.map((e) {
                  var currentIndex = _controller.bannerData.indexOf(e);
                  return Container(
                    margin: const EdgeInsets.only(left: 5),
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                      //color: bannerData==currentIndex?Colors.amber:Colors.black,
                        color: _controller.sliderCurrentPosition.value == currentIndex ? Colors
                            .amber : Colors.black,
                        borderRadius: const BorderRadius.all(
                            Radius.circular(10))

                    ),

                  );
                }).toList(),
              )))
        ],
      ),
    );
  }
}
