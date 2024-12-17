import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/deal_list_view.dart';
import '../widgets/search_bar_widget.dart';
import '../widgets/tap_selector.dart';
import '../widgets/top_card.dart';

class MyDealsScreen extends StatefulWidget {
  const MyDealsScreen({super.key});

  @override
  State<MyDealsScreen> createState() => _MyDealsScreenState();
}

class _MyDealsScreenState extends State<MyDealsScreen> {
  /// logic is not separated from view because it is oly one screen
  ScrollController scrollController = ScrollController();
  checkPosithion() {
    if (scrollController.position.pixels <=
        scrollController.position.maxScrollExtent / 2) {
      goToLast();
    } else {
      goToFirst();
    }
    angle();
  }

  double angl = 0;

  angle<double>() {
    if (scrollController.position.pixels <=
        scrollController.position.maxScrollExtent / 2) {
      angl = 0;
    } else {
      angl = 3.09;
      setState(() {});
    }
    setState(() {});
  }

  goToLast() {
    scrollController
        .animateTo(
          scrollController.position.maxScrollExtent,
          curve: Curves.easeInOut,
          duration: const Duration(milliseconds: 2000),
        )
        .then((value) => angle());
    setState(() {});
  }

  goToFirst() {
    scrollController
        .animateTo(
          scrollController.position.minScrollExtent,
          curve: Curves.easeInOut,
          duration: const Duration(milliseconds: 2000),
        )
        .then((value) => angle());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildBackdrop(), // Backdrop with images and blur effect
        Scaffold(
          floatingActionButton: FloatingActionButton(
            shape: CircleBorder(),
            backgroundColor: Color(0xff000080),
            onPressed: () {
              checkPosithion();
            },
            child: Transform.rotate(
              angle: angl,
              child: Image.asset(
                'assets/icons/SCROLLiCON.png',
              ),
            ),
          ),
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Container(
                height: 40.h,
                width: 116.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Color(0xff1007FA), // Blue color for the border
                    width: 1.0, // Thickness of the border
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text("المفضلة",
                        style: TextStyle(color: Colors.black)),
                    Image.asset(
                      "assets/icons/save.png",
                    ),
                  ],
                )),
            centerTitle: false,
            actions: [
              _buildAppBarIcon("assets/icons/notification.png"),
              const SizedBox(width: 8),
              _buildAppBarIcon("assets/icons/arrow.png"),
              const SizedBox(width: 8),
            ],
          ),
          body: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                SizedBox(height: 25.h),
                const TopCards(),
                const SizedBox(height: 10),
                const TabSelector(),
                const SizedBox(height: 10),
                SearchBarWidget(),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "12 صفقة",
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff718096)),
                        ),
                        Text(
                          "الصفقات الجارية",
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        )
                      ]),
                ),
                SizedBox(height: 10.h),
                DealsListView(),
                SizedBox(height: 10.h),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBackdrop() {
    return SizedBox(
      height: 261.h,
      width: 375.w,
      child: Stack(
        children: [
          Positioned(
            top: 30.h,
            left: -1.w,
            child: _buildBlurredImage(
                'assets/imgs/backdropImgs/Group 1015.png', 15),
          ),
          Positioned(
            top: 29.h,
            right: 10.w,
            child: _buildBlurredImage(
                'assets/imgs/backdropImgs/Group 1017.png', 25),
          ),
          Positioned(
            top: 20.h,
            left: 115.w,
            child: _buildBlurredImage(
                'assets/imgs/backdropImgs/Group 1018.png', 7),
          ),
          Positioned(
            bottom: 30.h,
            right: 30.w,
            child: _buildBlurredImage(
                'assets/imgs/backdropImgs/Group 1020.png', 30),
          ),
        ],
      ),
    );
  }

  Widget _buildBlurredImage(String imagePath, double blurRadius) {
    return ImageFiltered(
      imageFilter: ImageFilter.blur(sigmaX: blurRadius, sigmaY: blurRadius),
      child: Image.asset(
        imagePath,
        width: 150.w,
        height: 150.h,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _buildAppBarIcon(String imagePath) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Color(0xff1007FA), // Blue color for the border
          width: 1.0, // Thickness of the border
        ),
      ),
      child: CircleAvatar(
        radius: 20, // Adjust the radius if needed
        backgroundColor: Colors.white,
        child: Image.asset(
          '$imagePath',
        ),
      ),
    );
  }
}
