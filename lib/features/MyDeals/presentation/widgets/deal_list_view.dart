import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/custom/widgets/custom__gradient_button.dart';

class DealsListView extends StatelessWidget {
  DealsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 12,
        itemBuilder: (context, index) {
          return _buildDealItem();
        },
      ),
    );
  }

  Widget _buildDealItem() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        width: 342.w,
        height: 338.h,
        decoration: BoxDecoration(color: Colors.white,
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                  height: 193.h,
                  child: Stack(
                    children: [
                      Image.asset("assets/imgs/bag.png",
                          width: 326.w, height: 174.h),
                      Positioned(
                          bottom: 0,
                          child: SizedBox(
                            width: 326.w,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CustomGradientButton(
                                  onPressed: () {},
                                  width: 81.w,
                                  text: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                          "assets/icons/Vector (1).png"),
                                      const SizedBox(width: 5),
                                      Text(
                                        "تفاصيل",
                                        style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                  colors: [
                                    Color(0xff0084CE),
                                    Color(0xff006AA7)
                                  ],
                                ),
                                SizedBox(
                                  width: 20.w,
                                ),
                                _buildItemWithIcon(
                                    imgPath: "assets/icons/time.png",
                                    text: "4 يوم",
                                    backgroundColor: Colors.white,
                                    textColor: Color(0xffE53E3E)),
                                _buildItemWithIcon(
                                    imgPath: "assets/icons/people.png",
                                    text: "5",
                                    backgroundColor: Colors.white,
                                    textColor: Color(0xff3AC1FF)),
                              ],
                            ),
                          ))
                    ],
                  )),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("شنط وإكسسوارات",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp,
                          color: Color(0xff718096))),
                  Text("شنطة سفر ضهر",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Colors.black87)),
                ],
              ),
              const SizedBox(height: 6),
              _buildIconWithText(
                  imgPath: "assets/icons/cash.png",
                  textColor: Color(0xff718096),
                  text: "قيمة الصفقة: 1000 ج.م",
                  fontWeight: FontWeight.w500),
              const SizedBox(height: 6),
              _buildIconWithText(
                  imgPath: "assets/icons/coins.png",
                  textColor: Color(0xff38A169),
                  text: "2000 ج.م ربح متوقع",
                  fontWeight: FontWeight.w600),
              const SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildIconWithText(
                      imgPath: "assets/icons/store.png",
                      textColor: Color(0xff38A169),
                      text: "31 طلب ",
                      fontWeight: FontWeight.w600),
                  _buildIconWithText(
                      imgPath: "assets/icons/bag of mony.png",
                      textColor: Color(0xff3AC1FF),
                      text: "10.000 ج.م أرباح محققة",
                      fontWeight: FontWeight.w600),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItemWithIcon({
    required String imgPath,
    required String text,
    required Color backgroundColor,
    required Color textColor,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      child: Padding(
        padding: const EdgeInsets.all(11.0),
        child: _buildIconWithText(
            imgPath: imgPath,
            textColor: textColor,
            text: text,
            fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget _buildIconWithText(
      {required String imgPath,
      required Color textColor,
      required String text,
      required FontWeight fontWeight}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          text,
          style: TextStyle(
              fontSize: 16.sp, fontWeight: fontWeight, color: textColor),
        ),
        const SizedBox(width: 5),
        Image.asset(imgPath),
      ],
    );
  }
}
